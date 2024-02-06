Kmom04 genomgång
=========================



Kika på kursmomentet
-------------------------

Kolla snabbt igenom vad som händer i kursmomentet.



Använd databasen "classicalmodels"
-------------------------

Vi fokuserar på tabellerna customers, orders, orderdetails, products.

* [titel...](https://gitlab.com/mikael-roos/database/-/tree/main/sql/classicmodels/order-product)

Vi joinar och tittar på nycklar och relationer 1:N och N:M.

<!--
* subquery
* full outer join
-->



Modellera med dia
-------------------------

<!--
Implementera en logisk modell hela vägen och fokusera på nycklar och visa hur man joinar  olika relationer.
-->

Modelleringsövning med dia, utveckla logiska & fysiska modeller av konceptuella modeller.

* [Bank](https://gitlab.com/mikael-roos/database/-/tree/main/er/bank) (modellera direkt i Dia - lär dig rita)
* [Library](https://gitlab.com/mikael-roos/database/-/tree/main/er/library) (modellera i markdown och rita sedan i Dia)

* customer, order, product (rita dia)
* Eliminera N:M
* PK/FK
* Skapa SQL

Implementera respektiva modell i databasen och testa.

* preppa exemplet? Implementera databasen och läs in data från excel
(se exemepel i google drive)

Glöm inte stegen.

7. Modifiera ER-diagram enligt relationsmodellen.
8. Utöka ER-diagram med primära/främmande nycklar samt kompletterande attribut.
9. Skapa SQL DDL för tabellerna.
10. Lista funktioner som databasen skall stödja (API).

Fokusera på hur man kan lösa en N:M förhållande i databasen.

* Använd PRIMARY KEY.
* Använd FOREIGN KEY.



Vad välja som primärnyckel till en databastabell?
-------------------------

<!--
Bygg in detta resonemanget i övningarna.
-->

* Välj en kolumn som gör raden unik ( i sammanhanget).
* Om två kolumner gör en rad unik, välj en sammansatt nyckel.
* Det finns automatgenererade nycklar.

<!-- https://dbwebb.se/t/6439 -->
