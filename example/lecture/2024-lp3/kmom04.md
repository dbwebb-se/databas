Kmom04 genomgång
=========================



Kika på kursmomentet
-------------------------

Kolla snabbt igenom vad som händer i kursmomentet.

<!--
Jobba med transaktion?
Variabler?
Låta övningen sköta det?
-->


Modellera med dia
-------------------------

<!--
.

Implementera en logisk modell hela vägen och fokusera på nycklar och visa hur man joinar  olika relationer.
-->

Modelleringsövning med dia, uteckla fysiska modell av logisk modell.

* [Library](https://gitlab.com/mikael-roos/database/-/tree/main/er/library) (Slutför library med steg 9 & 10 samt populera databasen och fyll den med värden)

* customer, order, product (rita dia)
* Eliminera N:M
* PK/FK
* Skapa SQL
* Använd PRIMARY KEY.
* Använd FOREIGN KEY.

Implementera respektiva modell i databasen och testa.

* preppa exemplet? Implementera databasen och läs in data från excel
(se exemepel i google drive)

* Gör en backup.



Vad välja som primärnyckel till en databastabell?
-------------------------

<!--
Bygg in detta resonemanget i övningarna.
-->

* Välj en kolumn som gör raden unik ( i sammanhanget).
* Om två kolumner gör en rad unik, välj en sammansatt nyckel.
* Det finns automatgenererade nycklar.

<!-- https://dbwebb.se/t/6439 -->



Använd databasen "classicalmodels"
-------------------------

Vi fokuserar på tabellerna customers, orders, orderdetails, products.
Fokus på produkter?

* [titel...](https://gitlab.com/mikael-roos/database/-/tree/main/sql/classicmodels/order-product)

Vi joinar och tittar på nycklar och relationer 1:N och N:M.

<!--
* subquery
* transpose
* full outer join
-->



