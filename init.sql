-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    point INTEGER
);


-- Insert data
INSERT INTO users (usernameu, password, point) VALUES
    ('admin', '$2b$12$s1wj98ds1os1AtIOoBHAT.0h1JlFsm/Htg5Es30PJQYmYjDALHZWK', 999),
    ('Alice', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 10),
    ('Bob', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 50);
