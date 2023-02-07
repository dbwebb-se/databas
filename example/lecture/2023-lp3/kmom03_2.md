Kmom03 genomgång (vecka 2)
=========================

Repetera snabbt igenom vad som händer i kursmomentet.

* (JavaScript/Node -> nästa vecka webbramverket Express)

* ER stegen
    * Följ stegen explicit i er.pdf
    * Näsa vecka översätt konceptuell modell till logisk modell
    * Bara titta framåt

* SQL guiden
    * Fler tabeller
    * Join
    * Outer join
    * Subquery



Modelleringsövning med dia
-------------------------

* Kund, order, produkter
* Delar av modelleringsövningen skissades på i dokumentet [`customer_order_product.md`](./customer_order_product.md)
* En diagramskiss med Dia sparades i [`kmom03_v2.dia`](./kmom03_v2.dia).
* En bild av diagramskissen finns även här i [`er_customer_order_product.png`](./er_customer_order_product.png)

Glöm inte stegen.

1. Beskriv databasen i ett textstycke.
2. Skriv ned alla entiteter.
3. Skriv ned alla relationer och visa i matris.
4. Rita enkelt ER-diagram med entiteter och relationer.
5. Komplettera ER-diagram med kardinalitet.
6. Komplettera ER-diagram med alla attribut samt kandidatnycklar.
7. Modifiera ER-diagram enligt relationsmodellen.
8. Utöka ER-diagram med primära/främmande nycklar samt kompletterande attribut.
9. Skapa SQL DDL för tabellerna.
10. Lista funktioner som databasen skall stödja (API).



Använd databasen "classicalmodels"
-------------------------

Vi fokuserar på tabellerna customers, orders, orderdetails, products.

* Join
* Outer join
* Sub query

Vi gjorde en reverse engineering av databasen och [sparade en bild](./../../classicalmodels/classicalmodels_reverse_er.png).

SQL-koden i genomgången sparades i [`example/classicalmodels/outer.sql`](./../../classicalmodels/outer.sql)
