--
-- Create the database schema.
--
USE dbwebb;



--
-- Start by dropping all tables, order may matter.
--
DROP TABLE IF EXISTS student2course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;



--
-- Table for student.
--
CREATE TABLE student
(
    acronym CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,

    PRIMARY KEY (acronym)
);



--
-- Table for course.
--
CREATE TABLE course
(
    code CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,
    nick CHAR(10) NOT NULL,
    points DECIMAL(2,1),

    PRIMARY KEY (code)
);



--
-- Table for student2course, connecting students taking a course
-- and eventually getting a grade.
--
CREATE TABLE student2course
(
    acronym CHAR(6) NOT NULL,
    code CHAR(6) NOT NULL,
    grade CHAR(1) NULL,

    FOREIGN KEY (acronym) REFERENCES student(acronym),
    FOREIGN KEY (code) REFERENCES course(code),

    PRIMARY KEY (acronym, code)
);
