--
-- Insert
--
USE er_library;
SELECT CONCAT("Database is '", DATABASE(), "'") AS Message;



--
-- Delete from all tables, order matters
--
DELETE FROM book2word;
DELETE FROM book2author;
DELETE FROM reservation;
DELETE FROM fine;
DELETE FROM loan;

-- leafs
DELETE FROM author;
DELETE FROM book;
DELETE FROM customer;
DELETE FROM headword;



--
--
--
INSERT INTO  book
    (isbn, publisher)
VALUES
    ("11111111-1", "Publisher A"),
    ("22222222-2", "Publisher A"),
    ("33333333-3", "Publisher B"),
    ("44444444-4", "Publisher B"),
    ("55555555-5", "Publisher C")
;

--
--
--
INSERT INTO  headword
    (word)
VALUES
    ("word1"),
    ("word2"),
    ("word3"),
    ("word4"),
    ("word5")
;



--
--
--
INSERT INTO  book2word
    (book_id, word_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 3),
    (3, 4),
    (4, 2),
    (4, 3)
;



--
--
--
INSERT INTO author
    (id, name, country)
VALUES
    (1, "Name 1", "Country 1"),
    (2, "Name 2", "Country 2"),
    (3, "Name 3", "Country 3"),
    (4, "Name 4", "Country 4"),
    (5, "Name 5", "Country 5")
;



--
--
--
INSERT INTO  book2author
    (book_id, author_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5)
;



--
--
--
INSERT INTO customer
    (id, name, phone, email)
VALUES
    (1, "Name 1", "Phone 1", "Email 1"),
    (2, "Name 2", "Phone 2", "Email 2"),
    (3, "Name 3", "Phone 3", "Email 3"),
    (4, "Name 4", "Phone 4", "Email 4"),
    (5, "Name 5", "Phone 5", "Email 5")
;



--
--
--
INSERT INTO reservation
    (book_id, name, phone)
VALUES
    (1, "Mumin", "555-101")
;



--
--
--
INSERT INTO loan
    (book_id, customer_id)
VALUES
    (1, 1)
;



--
--
--
INSERT INTO fine
    (loan_id, amount)
VALUES
    (1, 10)
;
