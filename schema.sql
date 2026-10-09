-- Run these queries in Supabase, if you make a new project/new tables

CREATE TABLE IF NOT EXISTS abc_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS abc_posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE abc_posts
    ADD COLUMN user_id INT,
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES abc_users(id);

ALTER TABLE abc_users
    ADD COLUMN role VARCHAR(20) NOT NULL DEFAULT 'user';
