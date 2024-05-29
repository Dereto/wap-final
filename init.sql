CREATE EXTENSION "uuid-ossp";

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100) Not NULL,
    point INTEGER DEFAULT 0,
    gender VARCHAR(10) DEFAULT 'Other',
    birthday DATE,
    self_description TEXT
);


-- Create book table
CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title VARCHAR UNIQUE,
    cover UUID DEFAULT uuid_generate_v4(),
    author VARCHAR,
    publisher VARCHAR,
    isbn VARCHAR,
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

CREATE TABLE IF NOT EXISTS reading_history (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    book_id INTEGER REFERENCES books(id) NOT NULL,
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data
INSERT INTO users (username, password, point, gender, birthday, self_description) VALUES
    ('admin', '$2b$12$s1wj98ds1os1AtIOoBHAT.0h1JlFsm/Htg5Es30PJQYmYjDALHZWK', 999, 'Other', '2000-01-01', 'The admin.'),
    ('Alice', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 10, 'Female', '2004-04-01', 'Just a test account.'),
    ('Bob', '$2b$12$xUbazOYRgTZ5XD9fajfM1uXvLmtAI5.nYsfmunp3aipppYsuW9vlC', 50, 'Male', '2008-10-31', 'Just another test account.');

-- Insert data into the books table
INSERT INTO books (title, author, description, total_pages, publisher, isbn) VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'The story of the mysteriously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan.', 3, 'NTU press', 'idontknowwahtisbnlooklike1'),
    ('To Kill a Mockingbird', 'Harper Lee', 'The story of young girl Scout Finch, her brother Jem, and their father Atticus, who defends a black man accused of raping a white woman.', 2, 'NCCU press', 'idontknowwahtisbnlooklike2'),
    ('1984', 'George Orwell', 'A dystopian novel set in a totalitarian regime, where the government constantly surveils its citizens and controls all aspects of their lives.', 3, 'NTU press', 'idontknowwahtisbnlooklike3'),
    ('Pride and Prejudice', 'Jane Austen', 'A romantic novel set in the early 19th century, revolving around the lives of the Bennet sisters and their pursuit of marriage.', 5, 'NTU press', 'idontknowwahtisbnlooklike4');

-- Insert data into the pages table
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('60a23a54-fc3e-49b5-89d2-0d527194fe0c', 1, 1),
    ('4df0d5b3-99ad-4fba-b9ae-9513db35e5d5', 1, 2),
    ('b8dbb208-df61-49bd-ade7-15fa2b7a73d0', 1, 3);

INSERT INTO pages (book_id, page_number) VALUES
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (3, 3);
