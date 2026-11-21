# Section 20: Implementing Database Design Patterns

## Overview
This section builds a full, production-ready schema for an Instagram-like social network. It handles users, posts, comments, likes, hashtags, photo tags, user mentions, and followers.

## Tables
- **`users`**: User profiles and logins. Kept separate as the core entity.
- **`posts`**: Uploaded photos, captions, and locations. Kept separate so users can have many posts.
- **`comments`**: Text comments on posts. Kept separate so posts can have thousands of comments.
- **`likes`**: Stores likes on both posts and comments using a single table.
- **`photo_tags`**: Stores where users are tagged in a photo (X and Y coordinates).
- **`caption_tags`**: Stores user @mentions in post text.
- **`hashtags`**: Unique list of hashtags (e.g. `#coding`).
- **`hashtags_posts`**: Junction table connecting posts to hashtags (Many-to-Many).
- **`followers`**: Junction table connecting users who follow other users.

## Relationships & Foreign Keys
- `posts.user_id -> users.id`: Links posts to their creators (`ON DELETE CASCADE`).
- `comments.user_id -> users.id` & `comments.post_id -> posts.id`: Connects comments to both the commenter and the post.
- `likes.user_id -> users.id`, `likes.post_id -> posts.id`, `likes.comment_id -> comments.id`: Links likes to the user and either a post or a comment.
- `hashtags_posts.post_id -> posts.id` & `hashtags_posts.hashtag_id -> hashtags.id`: Enables Many-to-Many tagging between posts and hashtags.
- `followers.leader_id -> users.id` & `followers.follower_id -> users.id`: Connects followed users and their followers.

## Design Tradeoff
We created a single **polymorphic `likes` table** with a `CHECK` constraint that makes sure a like is attached to *either* a post or a comment, but never both:
```sql
CHECK (COALESCE((post_id IS NOT NULL)::INTEGER, 0) + COALESCE((comment_id IS NOT NULL)::INTEGER, 0) = 1)
```
The alternative was two separate tables (`post_likes` and `comment_likes`). A single table was chosen because it simplifies counting total user likes across all content in one place.

## PostgreSQL Features
- **Composite Unique Keys**: Uses `UNIQUE (user_id, post_id)` to prevent a user from liking or tagging the same item twice.

## Datasets
- `users_social.csv`, `posts_social.csv`, `comments_social.csv`, `likes_social.csv`: Core social data.
- `photo_tags.csv`, `caption_tags.csv`: Tag data.
- `hashtags.csv`, `hashtags_posts.csv`: Hashtags and links.
- `followers.csv`: Follower graph.
