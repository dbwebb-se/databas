Ta backup och verifiera
=================================

I [katalogen här](.) finns två bash-script som hjälper dig att ta en backup av din databas och verifiera den.

Studera källkoden i bash-skripten, innan du exekverar dem.



backup.bash
---------------------------------

Skriptet [`backup.bash`](./backup.bash) tar en backup av din databas och inkluderar lagrade procedurer, funktioner och triggers.

Du använder skriptet så här:

```
bash backup.bash
```

Skriptet tar en backup av databasen 'eshop' som default. Du kan ändra vilken databas som tas backup av genom att lägga till ett argument till kommandot.

```
bash backup.bash bank
```

Det kan se ut så här när du exekverar kommandot.

```
$ bash backup.bash bank
Taking a backup of the database 'bank'.
-rw-rw-r-- 1 mos mos 6158 feb 20 11:54 bank.sql
```

Nu finns din backupfil i `bank.sql` och du kan titta [här i backupfilen](./bank.sql) för att se hur en backupfil ser ut.



verify.bash
---------------------------------

För att verifiera att en backupfil fungerar så laddar man in den mot en ny databas. Därefter kan man ändra sin konfiguration för sin applikation så att den går mot en ny databas. Om backupen fungerar så skall allt fungera som vanligt i din applikation.

Skriptet [`verify.bash`](./verify.bash) tar en backupfil och kör den mot en databas 'verify'. 

```
bash verify.bash
```

Som default använder skriptet en fil `eshop.sql`.

Du kan lägga till ett argument till kommandot för att använda en annan backupfil.

```
bash verify.bash bank.sql
```

Det kan se ut så här när du kör skriptet.

```
$ bash verify.bash bank.sql
Loading backup file 'bank.sql' into db 'verify'.
+------------------+
| Tables_in_verify |
+------------------+
| account          |
| account_log      |
| v_proc           |
| v_trig           |
+------------------+
+------------+-----------+--------+
| Name       | Type      | Db     |
+------------+-----------+--------+
| move_money | PROCEDURE | verify |
+------------+-----------+--------+
+--------+---------+-------+--------+--------------------+
| Db     | Table   | When  | Event  | Name               |
+--------+---------+-------+--------+--------------------+
| verify | account | AFTER | UPDATE | log_balance_update |
+--------+---------+-------+--------+--------------------+
```

Skriptet skriver ut vilka databastabeller som databasen 'verify' nu innehåller.

De två vyerna `v_proc` och `v_trig` är tillagda av skriptet för att göra det enklare att se vilka lagrade procedurer och triggers som finns i databasen. De två sista utskrifterna visar vilka procedurer som finns och vilka triggers som finns.

Nu kan du använda databasen 'verify' för att inspektera databasen som byggdes upp av backupfilen.

