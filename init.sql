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
    cover UUID UNIQUE DEFAULT uuid_generate_v4() ,
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
INSERT INTO books (title, author, description, total_pages, publisher, isbn, cover) VALUES
    ('Sea: A World Beneath the Waves', 'Patricia Hegarty, Britta Teckentrup', 'Discover a world beneath the waves that is teeming with life, from tiny graceful seahorses to darting tropical fish and from electric eels to humpback whales. A colourful array of sea creatures is brought to life by award-winning illustrator Britta Teckentrup in this delightful peep-through picture book.', 6, 'Little Tiger Press Publication', '9781788816298', '2921b5f9-68bd-4d9b-bc90-94ed38d8e907'),
    ('From Head to Toe', 'Eric Carle', 'What does an elephant do? It stomps its foot. Can you? From the creator of such beloved classics as The Grouchy Ladybug and The Mixed-Up Chameleon comes this interactive story that invites kids to imitate animal movements. Watching giraffes bend their necks or monkeys wave their arms is fun, but nothing could be better than joining in. From their heads down to their toes, kids will be wriggling, jiggling, and giggling as they try to keep up with these animals! Alligators wiggle, elephants stop, gorillas thump, and giraffes bend. Can you do it? ‘ I can do it!’ is the confidence-building message of this fun-filled interactive picture book. A variety of familiar animals invite young children to copy their antics, and as they play, they will learn such important skills as careful listening, focusing attention, and following instructions. Just as alphabet books introduce the very young child to letters and simple words, From Head to Toe introduces the basic body parts and simple body movements. And in the same way that children progress from understanding simple words to reading and writing sentences and stories, so they will progress from simple body movements to dancing, gymnastics, and other sportsand activities, with confidence and pleasure.', 5, 'HarperFestival', '9780694013012', 'ff5711fe-8777-4523-b10e-fc1b6e758546'),
    ('The Cat Who Couldn’t Be Bothered', 'Jack Kurland', 'There is a cat. A cat that couldn’t be bothered to do anything … anything at all. His friends ask him if he wants to play but he doesn’t feel like it. They invite him on adventures to far-off places, but he would rather stay at home. Until one day, a friend asks how he is doing, and the true reason why he’d rather do nothing is revealed. He is feeling sad.', 5, 'Frances Lincoln Children’s Books', '9780694013012', 'a7ac52a0-9a7f-41c0-ace4-82692ba5f6d2'),
    ('Who Loves You?', 'Dr Seuss', ' Say \"I love you\" to someone special with this small hardcover gift book featuring Dr. Seuss’s most beloved characters! An ideal choice in place of a Valentine’s Day, anniversary, birthday, or greeting card, this rhymed keepsake is perfect for children AND adults, and includes a mirror at the end and foil trim on the cover!', 6, 'Random House Books for Young Readers', '9780593648360', '0ca5adb3-74bb-4e18-b311-77c1daf0b0e1'),
    ('The Very Hungry Caterpillar', 'Eric Carle', 'Eric Carle’s classic, The Very Hungry Caterpillar, in board book format. A much-loved classic, The Very Hungry Caterpillar has won over millions of readers with its vivid and colourful collage illustrations and its deceptively simply, hopeful story. With its die-cut pages and finger-sized holes to explore, this is a richly satisfying book for children. Eric Carle is an internationally bestselling and award winning author and illustrator of books for very young children.', 3, 'Puffin', '9780241003008', 'ab0b63ff-6c93-4c22-a178-a0942e9a2555');

-- Insert data into the pages table
-- Book 1
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('89d89267-9a8f-4840-82f4-19195cf928ac', 1, 1),
    ('1c9b9339-81aa-455f-bceb-925217c4d677', 1, 2),
    ('e571c5f7-bc57-4d35-84a8-2054e29191db', 1, 3),
    ('5c6bc02d-5297-4681-94a8-1b4703e6d1c5', 1, 4),
    ('596740b8-52f6-4de8-9763-9c86b0be9346', 1, 5),
    ('912618e8-4bdd-4e9e-9dbf-0263f135e5f2', 1, 6);

-- Book 2
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('3deb1414-0a74-4a13-8a17-a279b68b8723', 2, 1),
    ('cfb4d059-6046-44aa-ba5c-5edec421d5ac', 2, 2),
    ('4bccf546-0079-4692-950a-82f1982fbc29', 2, 3),
    ('91efba67-a871-4068-960f-671ed8e74c5a', 2, 4),
    ('dc4f26b2-8a38-46d0-90f9-844c88615283', 2, 5);

-- Book 3
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('3e1ffc86-adbf-49c6-b5f2-d154f5741132', 3, 1),
    ('66bc039d-cd44-423a-80fd-835a141de83a', 3, 2),
    ('10ff285f-74fd-4b2e-a013-e1b470417b65', 3, 3),
    ('4b8639ad-8672-4aa4-8849-bac3a33efd6a', 3, 4),
    ('56002cf6-e567-445f-bee6-dfcde6e1541d', 3, 5);

-- Book 4
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('f3fbe022-ad11-42ab-8707-c915ac51dcb6', 4, 1),
    ('e2596a4b-2e27-408f-845b-17fa76a6a590', 4, 2),
    ('c959c3f1-70d0-41e7-b07d-17fe16f64b26', 4, 3),
    ('bd735b12-c03b-474d-b522-b797e9d04f76', 4, 4),
    ('219d9305-bc5b-4409-aba2-3eaaef8dbbd9', 4, 5),
    ('dc2d5d0f-03ef-4c02-9697-a5fc39d59379', 4, 6);

-- Book 5
INSERT INTO pages (uuid, book_id, page_number) VALUES
    ('874b2bb1-36f3-4411-9456-2bb49503e8fe', 5, 1),
    ('d58954b2-f144-42b7-bafb-4e24c6bb4031', 5, 2),
    ('a571df83-8a42-4042-af90-2dd0d711918e', 5, 3);