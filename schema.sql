-- schema.sql
-- Complete PostgreSQL Database Schema
-- Tested for clean execution: psql -f schema.sql

DROP TABLE IF EXISTS followers CASCADE;
DROP TABLE IF EXISTS hashtags_posts CASCADE;
DROP TABLE IF EXISTS hashtags CASCADE;
DROP TABLE IF EXISTS caption_tags CASCADE;
DROP TABLE IF EXISTS photo_tags CASCADE;
DROP TABLE IF EXISTS likes CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- 1. Users Table
CREATE TABLE users (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    username   VARCHAR(30) NOT NULL UNIQUE,
    bio        VARCHAR(400),
    avatar     VARCHAR(200),
    phone      VARCHAR(25),
    email      VARCHAR(40),
    password   VARCHAR(50),
    status     VARCHAR(15),
    CHECK (COALESCE(phone, email) IS NOT NULL)
);

-- 2. Posts Table
CREATE TABLE posts (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    url        VARCHAR(200) NOT NULL,
    caption    VARCHAR(240),
    lat        REAL,
    lng        REAL,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

-- 3. Comments Table
CREATE TABLE comments (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    contents   VARCHAR(240) NOT NULL,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE
);

-- 4. Likes Table (Polymorphic with Check Constraint)
CREATE TABLE likes (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    comment_id INTEGER REFERENCES comments(id) ON DELETE CASCADE,
    CHECK (
        COALESCE((post_id IS NOT NULL)::INTEGER, 0)
        + COALESCE((comment_id IS NOT NULL)::INTEGER, 0) = 1
    ),
    UNIQUE (user_id, post_id, comment_id)
);

-- 5. Photo Tags Table (Spatial Coordinates)
CREATE TABLE photo_tags (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    x          INTEGER NOT NULL,
    y          INTEGER NOT NULL,
    UNIQUE (user_id, post_id)
);

-- 6. Caption Tags Table (Mentions)
CREATE TABLE caption_tags (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    UNIQUE (user_id, post_id)
);

-- 7. Hashtags Table
CREATE TABLE hashtags (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    title      VARCHAR(20) NOT NULL UNIQUE
);

-- 8. Hashtags-Posts Junction Table (Many-to-Many)
CREATE TABLE hashtags_posts (
    id         SERIAL PRIMARY KEY,
    hashtag_id INTEGER NOT NULL REFERENCES hashtags(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    UNIQUE (hashtag_id, post_id)
);

-- 9. Followers Table (Self-Referential Social Graph)
CREATE TABLE followers (
    id          SERIAL PRIMARY KEY,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    leader_id   INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE (leader_id, follower_id)
);

-- Basic Indexes on Foreign Keys and Frequently Queried Columns
CREATE INDEX idx_posts_user_id ON posts (user_id);
CREATE INDEX idx_comments_user_id ON comments (user_id);
CREATE INDEX idx_comments_post_id ON comments (post_id);
CREATE INDEX idx_likes_user_id ON likes (user_id);
CREATE INDEX idx_likes_post_id ON likes (post_id);
CREATE INDEX idx_likes_comment_id ON likes (comment_id);
CREATE INDEX idx_photo_tags_user_id ON photo_tags (user_id);
CREATE INDEX idx_photo_tags_post_id ON photo_tags (post_id);
CREATE INDEX idx_caption_tags_user_id ON caption_tags (user_id);
CREATE INDEX idx_caption_tags_post_id ON caption_tags (post_id);
CREATE INDEX idx_hashtags_posts_hashtag_id ON hashtags_posts (hashtag_id);
CREATE INDEX idx_hashtags_posts_post_id ON hashtags_posts (post_id);
CREATE INDEX idx_followers_leader_id ON followers (leader_id);
CREATE INDEX idx_followers_follower_id ON followers (follower_id);

CREATE INDEX idx_users_username ON users (username);
CREATE INDEX idx_posts_created_at ON posts (created_at DESC);
CREATE INDEX idx_hashtags_title ON hashtags (title);
