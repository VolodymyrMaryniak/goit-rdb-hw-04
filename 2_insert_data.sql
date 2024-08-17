USE LibraryManagement;

INSERT INTO authors (author_name)
VALUES ('Stephen King'), ('J. K. Rowling'), ('Colleen Hoover');

INSERT INTO genres (genre_name)
VALUES ('Horror'), ('Fantasy');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES 
	('It', 1986, 1, 1),
    ('The Shining', '1977', 1, 1),
    ('Harry Potter and the Prisoner of Azkaban', '1999', 2, 2);

INSERT INTO users (username, email)
VALUES 
	('volodymyr473', 'volodymyr.maryniak@gmail.com'),
	('testuser326', 'testuser@gmail.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES 
	(1, 1, '2023-12-31', '2024-02-15'),
	(1, 1, '2024-02-15', '2024-05-18'),
	(1, 1, '2024-04-11', NULL);
