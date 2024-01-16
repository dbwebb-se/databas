Kmom01 genomgång
=========================

Syftet är att visa hur labbmijlön fungerar i ett sammanhang och samtidigt visa hur man skapar en enkel databas och hur man jobbar med en befintlig databas i de olika klienterna.



Labbmiljön är på plats
-------------------------

Jag kommer visa min egen labbmiljö och hur jag jobbar med de olika klienterna.

Vi dubbelkollar att `.my.cnf` fungerar.



Fixa användaren `maria@localhost` och `maria@%`
-------------------------

Vi fixar in användaren maria och dbadm genom att tjuvkika på de scripten som ger facit för hur användarna skapas.

* `example/sql/v2/create-user-maria.sql`
* `example/sql/v2/create-user-dbadm.sql`
* `example/sql/v2/check-status.sql`



Skapa en egen databas
-------------------------

Vi leker runt och gör CREATE DATABASE/TABLE, SELECT, INSERT, UPDATE, DELETE, DROP.

`example/sql/v2/intro.sql`

<!-- Kopiera och gör till en övning i database-repot -->



Använd databasen "world"
-------------------------

Vi använder en färdig databas "world", laddar in den och ser vad den innehåller och avslutar med en JOIN.

`example/world`

<!-- Jobba igenom de övningar som finnsi databas-repot och förbättra -->
