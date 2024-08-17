CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE authors (
	author_id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE genres (
	genre_id INT NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE books (
	book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    publication_year INT NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE borrowed_books (
	borrow_id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NULL,
    PRIMARY KEY (borrow_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
