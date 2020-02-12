The Library
=======================

A library has a large collection of books. From each book the author, ISBN number, publisher and headwords (in Swedish: "uppslagsord") should be stored.

The customers of the library can make reservations for a specific book. When a customer wants to loan a book from the library information about the start time and end time has to be recorded. When a customer does not deliver a book in time he or she gets a fine. The fines have to be stored in a table in the database. Important information about authors are name and country.



Resources
-----------------------

* Conceptual model
    * [Dia](conceptual.dia)
    * [Text](conceptual.txt)
* Logical model
    * [Dia](logical.dia)
    * [Text](logical.txt)
* Physical model
    * [SQL](physical.sql)

Run sample database.

```
mysql < physical_ddl.sql
mysql < physical_insert.sql
```

Review, use and play around with the database using `physical_dml.sql`.
