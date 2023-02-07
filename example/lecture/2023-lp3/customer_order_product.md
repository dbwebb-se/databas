Order with products
==========================

The company has customers (name, id, city) which places orders (date, status, id) which contains products (id, name, price).

A order contains several products. The customer can order 1 or several items of each product within the same order.

1. Beskriv databasen i ett textstycke.
2. Skriv ned alla entiteter.

* customer
* order
* product

3. Skriv ned alla relationer och visa i matris.

* customers places orders
* order contains products
* order contains several products
* customer can order 1 or several items of each product within the same order

* customer places many order - 1:N
* order contains products, a product exists in several orders - N:M

4. Rita enkelt ER-diagram med entiteter och relationer.
5. Komplettera ER-diagram med kardinalitet.
6. Komplettera ER-diagram med alla attribut samt kandidatnycklar.

* customer (name, *id, city)
* order (date, status, *number)
* product (*id, name, price)


7. Modifiera ER-diagram enligt relationsmodellen.
8. Utöka ER-diagram med primära/främmande nycklar samt kompletterande attribut.
9. Skapa SQL DDL för tabellerna.
10. Lista funktioner som databasen skall stödja (API).
