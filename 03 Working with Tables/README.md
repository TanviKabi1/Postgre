# Section 03: Working with Tables

## Overview
This section builds a basic social media setup with users, photos, and comments. It covers table creation, auto-incrementing primary keys, and foreign keys with delete rules.

## Tables
- **`users`**: Stores user accounts (`id`, `username`). Kept separate because users exist before they post anything.
- **`photos`**: Stores photo URLs and the uploader's `user_id`. Kept separate so one user can post multiple photos without repeating their username.
- **`comments`**: Stores comments on photos. Kept separate so multiple users can comment on any photo without cluttering the photo row.

## Relationships & Foreign Keys
- `photos.user_id -> users.id`: Links a photo to the user who posted it. Uses `ON DELETE CASCADE` so deleting a user removes their photos.
- `comments.user_id -> users.id`: Tracks who wrote the comment.
- `comments.photo_id -> photos.id`: Links the comment to the photo. Deleting the photo removes its comments.

## Design Tradeoff
We use `ON DELETE CASCADE` in PostgreSQL to clean up child rows automatically. The alternative was deleting child rows manually from app code. Letting the database handle it is safer because it prevents leftover orphan rows if the app crashes mid-way.

## PostgreSQL Features
- **Auto Increment**: Uses `SERIAL` to create unique IDs automatically.
- **Foreign Keys**: Enforces parent-child rules directly in the database engine.

## Datasets
- `users.csv`: User profiles.
- `photos.csv`: Uploaded photo links.
- `comments.csv`: Comment text linked to users and photos.
