-- Dataset: users_social.csv, posts_social.csv, comments_social.csv, likes_social.csv, photo_tags.csv, caption_tags.csv, hashtags.csv, hashtags_posts.csv, followers.csv
-- Database: instagram

-- SECTION 20: Implementing Database Design Patterns

-- Create users table with constraints and checks
CREATE TABLE users (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    username   VARCHAR(30) NOT NULL,
    bio        VARCHAR(400),
    avatar     VARCHAR(200),
    phone      VARCHAR(25),
    email      VARCHAR(40),
    password   VARCHAR(50),
    status     VARCHAR(15),
    CHECK (COALESCE(phone, email) IS NOT NULL)
);

-- Create posts table
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

-- Create comments table
CREATE TABLE comments (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    contents   VARCHAR(240) NOT NULL,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE
);

-- Create likes table with polymorphic check constraint
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

-- Create photo tags table
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

-- Create caption tags table
CREATE TABLE caption_tags (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    UNIQUE (user_id, post_id)
);

-- Create hashtags table
CREATE TABLE hashtags (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    title      VARCHAR(20) NOT NULL UNIQUE
);

-- Create hashtags posts junction table
CREATE TABLE hashtags_posts (
    id         SERIAL PRIMARY KEY,
    hashtag_id INTEGER NOT NULL REFERENCES hashtags(id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    UNIQUE (hashtag_id, post_id)
);

-- Create followers table
CREATE TABLE followers (
    id          SERIAL PRIMARY KEY,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    leader_id   INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE (leader_id, follower_id)
);
