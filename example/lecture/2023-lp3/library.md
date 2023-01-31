Library
========================

1) Beskriv databasen i ett textstycke
------------------------

The library stores books and has a database for all books. A book has an ISBN, title and author. Each book is categorized into one or several categories, a category can have several books. A category has a name, description and an id. Details about the author are also stored, such as name, birthdate and birth country. The author can write several books and each book can have one or several authors.


2) Skriv ned alla entiteter
------------------------

* book
* category
* author


3) Skriv ned alla relationer (och visa i matris)
------------------------

* Each book is categorized into one or several categories
* The author can write several books
* Each book can have one or several authors


4) Rita enkelt ER-diagram med entiteter och relationer
------------------------


5) Komplettera ER-diagram med kardinalitet
------------------------

* book (1) has (N) category - 1:N
* author (N) writes (M) book - N:M 


6) Komplettera ER-diagram med alla attribut samt kandidatnycklar
------------------------

* book (*ISBN, title, author)
* category (*name, description, *id)
* author (name, birthdate, birth country)
