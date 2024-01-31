Kmom03 genomgång (vecka 1)
=========================



Allmänt
-------------------------

* Kodstandard SQL
    * small_caps only



Kika på kursmomentet
-------------------------

* Kika på kmom03, översikt, notera 20+20h
* Kika på ER-modelleringsuppgiften och hur det hänger ihop med kmom04

* Skapa en mall för ER-dokumentet
    * Gå till kokboken, lyft ut stegen och skapa rubriker
    * Mall till Er-modelleringen
        * https://docs.google.com/document/d/17w76pgm5g2z_v-VBSetqtgJkY2U5Wk-PhLaEGg3QBHU/edit?usp=sharing



Använd databasen "classicmodels"
-------------------------

Vi använder en ny och lite större databas där vi tränar UNION, INNER/OUTER JOIN och subqueries.

* [Classic models database: Get going with UNION, JOIN and subquery](https://gitlab.com/mikael-roos/database/-/tree/main/sql/classicmodels/join)

Gör en reverse engineering och inspektera vad som är PRIMARY/FOREIGN KEY i tabellerna.



Träna ER konceptuell modellering
-------------------------

Använd stegen från kokboken. Modellera i Markdown och sedan i Dia.

<!-- 
Man hinner en övning på 30-45 min, inte två. Bank är en bra start.
-->

* [Bank](https://gitlab.com/mikael-roos/database/-/tree/main/er/bank) (modellera direkt i Dia - lär dig rita)
* [Library](https://gitlab.com/mikael-roos/database/-/tree/main/er/library) (modellera i markdown och rita sedan i Dia)

Använd Dia för att rita.

Om termer vid ER: http://www.databasteknik.se/webbkursen/er/index.html

Glöm inte stegen.

1. Beskriv databasen i ett textstycke.
2. Skriv ned alla entiteter.
3. Skriv ned alla relationer och visa i matris.
4. Rita enkelt ER-diagram med entiteter och relationer.
5. Komplettera ER-diagram med kardinalitet.
6. Komplettera ER-diagram med alla attribut samt kandidatnycklar.

<!--
Fokusera på hur man kan lösa en N:M förhållande i databasen.

* Använd PRIMARY KEY.
* Använd FOREIGN KEY.
-->
