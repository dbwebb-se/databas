Kmom03 genomgång (vecka 2)
=========================



Kika på kursmomentet
-------------------------

Repetera snabbt igenom vad som händer i kursmomentet.

* (JavaScript/Node -> nästa vecka webbramverket Express)

* ER stegen
    * Följ stegen explicit i er.pdf
    * Nästa vecka översätt konceptuell modell till logisk modell
    * Bara titta framåt om något blir fel

* SQL guiden
    * Fler tabeller
    * Join
    * Outer join
    * Subquery

<!--
* Fråga om dbwebb validate, `eslint` och `eslint --fix`
-->

Att ta en backup, skriptet.



Använd databasen "classicalmodels"
-------------------------

Vi fokuserar på tabellerna customers, orders, orderdetails, products.

* [Classic models database: Customer, orders and orderdetails](https://gitlab.com/mikael-roos/database/-/tree/main/sql/classicmodels/order-order-details)

Vi joinar och tittar på nycklar och relationer 1:N och N:M samt vad transpose innebär.



Modelleringsövning med dia
-------------------------

Jobba med modelleringsövning.

* [Library](https://gitlab.com/mikael-roos/database/-/tree/main/er/library) (modellera i markdown och rita sedan i Dia eller använd färdigritad bild i Dia och prata runt)

<!--
* Kund, order, produkter (ny modelleringsövning?)
* Delar av modelleringsövningen skissades på i dokumentet [`customer_order_product.md`](./customer_order_product.md)
* En diagramskiss med Dia sparades i [`kmom03_v2.dia`](./kmom03_v2.dia).
* En bild av diagramskissen finns även här i [`er_customer_order_product.png`](./er_customer_order_product.png)
-->

Glöm inte stegen.

* Konceptuell modellering
    1\. Beskriv databasen i ett textstycke.
    2\. Skriv ned alla entiteter.
    3\. Skriv ned alla relationer och visa i matris.
    4\. Rita enkelt ER-diagram med entiteter och relationer.
    5\. Komplettera ER-diagram med kardinalitet.
    6\. Komplettera ER-diagram med alla attribut samt kandidatnycklar.
* Logisk modellering
    7\. Modifiera ER-diagram enligt relationsmodellen.
    8\. Utöka ER-diagram med primära/främmande nycklar samt kompletterande attribut.
* Fysisk modellering
    9\. Skapa SQL DDL för tabellerna.
    10\. Lista funktioner som databasen skall stödja (API).
