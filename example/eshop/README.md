Skapa csv-filer från Google sheet
=============================

Här finns ett exempel på hur du kan skapa csv-filer från ett excelark likt Google sheet. Tanken är att det är enklare att fylla ett sheet med data till dina tabeller och sedan kör du ett bash-skript för att hämta csv-filerna.



Google sheet med data till tabeller
-----------------------------

Själva Google sheetet hittar du på [denna länken](https://docs.google.com/spreadsheets/d/1yz0-C1SFYvNw_mN5CrZd9QrjKUXqKv3OhSlGUci8Mls/gviz/tq?tqx=out:csv&sheet).

Första sidan förklarar detaljerna i hur det fungerar och ger dig länken som krävs för nedladdning. Man laddar ner varje flik för sig.

I flikarna finns respektive "tabell" som skall genereras till csv.

Du kan ta en kopia av excelarket och uppdatera länken till det, sedan kan du sätta igång.



Bash-skript för att hämta csv-filer
-----------------------------

Bash-skriptet som hämtar varje flik kan skådas i [`download-eshop1-csv.bash`](./download-eshop1-csv.bash).

Det ser ut så här när du kör det.

```
$ bash download-eshop1-csv.bash 
kund
produkt
kategori
produkt2kategori
lager
produkt2lager
```



Ladda csv-filer till databasens tabeller
-----------------------------

När du har dina csv-filer på plats så kan du ladda in datat från csv-filerna till dina tabeller i din databas, ungefär som du gjorde i guiden "[Importera från Excel till Tabell](https://dbwebb.se/guide/kom-igang-med-sql-i-mysql-v2/importera-fran-excel-till-tabell)".
