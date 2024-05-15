CREATE EXTENSION "uuid-ossp";

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    point INTEGER
);


-- Create book table
CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title VARCHAR UNIQUE,
    author VARCHAR,
    description TEXT,
    total_pages INTEGER NOT NULL
);

-- Create page table
CREATE TABLE IF NOT EXISTS pages (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    book_id INTEGER REFERENCES books(id) NOT NULL,
    page_number INTEGER NOT NULL,
    UNIQUE(book_id, page_number)
);

-- Insert data
INSERT INTO users (username, password, point) VALUES
    ('admin', '$2b$12$s1wj98ds1os1AtIOoBHAT.0h1JlFsm/Htg5Es30PJQYmYjDALHZWK', 999),
    ('Alice', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 10),
    ('Bob', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 50);

-- Insert data into the books table
INSERT INTO books (title, author, description, total_pages) VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'The story of the mysteriously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan.', 3),
    ('To Kill a Mockingbird', 'Harper Lee', 'The story of young girl Scout Finch, her brother Jem, and their father Atticus, who defends a black man accused of raping a white woman.', 2),
    ('1984', 'George Orwell', 'A dystopian novel set in a totalitarian regime, where the government constantly surveils its citizens and controls all aspects of their lives.', 3),
    ('Pride and Prejudice', 'Jane Austen', 'A romantic novel set in the early 19th century, revolving around the lives of the Bennet sisters and their pursuit of marriage.', 5);

-- Insert data into the pages table
INSERT INTO pages (book_id, page_number) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (3, 3)
