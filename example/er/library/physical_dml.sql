--
--
--
USE er_library;
SELECT "Database is 'er_library'" AS Message;



--
-- Show data of all tables
--
SELECT * FROM book2word;
SELECT * FROM book2author;
SELECT * FROM reservation;
SELECT * FROM fine;
SELECT * FROM loan;
SELECT * FROM author;
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM headword;


--
-- Show the books and current reservations
--  make a reservation
--  join book & reservation
--
SELECT * FROM book;
SELECT * FROM reservation;

INSERT INTO reservation
    (book_id, name, phone)
VALUES
    (2, "Moped", "555-102")
;

SELECT
    *
FROM reservation AS r
JOIN book AS b
    ON r.book_id = b.id
;



--
-- Show books and their loan status
--  make a loan
--
SELECT * FROM book;
SELECT * FROM loan;

INSERT INTO loan
    (book_id, customer_id)
VALUES
    (2, 2)
;

SELECT
    *
FROM book AS b
LEFT OUTER JOIN loan AS l
    ON b.id = l.book_id
;



--
-- Show books, loans and fines
--  add fine
--  use GROUP_CONCAT
--
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM fine;
SELECT * FROM loan;

INSERT INTO fine
    (loan_id, amount)
VALUES
    (2, 30)
;

-- Show book name, isbn, lender, start
SELECT
    b.isbn AS "ISBN",
    l.id AS "Loan id",
    DATE(l.start_ts) AS "Begin",
    DATE(l.end_ts) AS "End",
    c.name AS "Customer",
    f.id AS "Fine id",
    DATE(f.ts) AS "When",
    f.amount AS "Amount"
FROM fine AS f
JOIN loan AS l
    ON f.loan_id = l.id
JOIN book AS b
    ON b.id = l.id
JOIN customer AS c
    ON c.id = l.customer_id
;



--
-- Return book
--
UPDATE loan SET
    end_ts = NOW()
WHERE
    id = 1
;



--
-- Show books, headwords and author
--  use GROUP_CONCAT
--
SELECT * FROM book;
SELECT * FROM headword;
SELECT * FROM book2word;

-- Join (inner) book & book2word, and use group concat
SELECT
    *
FROM book AS b
JOIN book2word AS b2w
    ON b.id = b2w.book_id
;

SELECT
    b.*,
    GROUP_CONCAT(b2w.word_id) AS "Word id"
FROM book AS b
JOIN book2word AS b2w
    ON b.id = b2w.book_id
GROUP BY
    b.id
;

-- Join (inner) book & book2word, word, and use group concat
SELECT
    *
FROM book AS b
JOIN book2word AS b2w
    ON b.id = b2w.book_id
JOIN headword AS w
    ON w.id = b2w.word_id
;

SELECT
    b.*,
    GROUP_CONCAT(b2w.word_id) AS "Word id",
    GROUP_CONCAT(w.word) AS "Word"
FROM book AS b
JOIN book2word AS b2w
    ON b.id = b2w.book_id
JOIN headword AS w
    ON w.id = b2w.word_id
GROUP BY
    b.id
;

-- Update to outer join
SELECT
    b.*,
    GROUP_CONCAT(b2w.word_id) AS "Word id",
    GROUP_CONCAT(w.word) AS "Word"
FROM book AS b
LEFT OUTER JOIN book2word AS b2w
    ON b.id = b2w.book_id
LEFT OUTER JOIN headword AS w
    ON w.id = b2w.word_id
GROUP BY
    b.id
;

-- Add author and use distinct on group concat
SELECT
    b.*,
    GROUP_CONCAT(DISTINCT a.id) AS "Author id",
    GROUP_CONCAT(DISTINCT w.word ORDER BY w.word DESC SEPARATOR ', ') AS "Word"
FROM book AS b
JOIN book2author AS b2a
    ON b2a.book_id = b.id
JOIN author AS a
    ON b2a.author_id = a.id
LEFT OUTER JOIN book2word AS b2w
    ON b.id = b2w.book_id
LEFT OUTER JOIN headword AS w
    ON w.id = b2w.word_id
GROUP BY
    b.id
;
