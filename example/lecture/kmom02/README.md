Notes to lecture
===================================



Bash
-----------------------------------

* Skapa bash-fil
* Visa CRLF kontro LF
* Show hidden i texteditor
* file *
* hexdump -C
* chmod 755 körbar fil



Terminalklient
-----------------------------------

```
mysql -uuser
mysql -uuser -p
mysql -uuser -ppass
mysql -uuser -ppass skolan
mysql -uuser -ppass skolan < fil.sql
```

```
mysql --help
mysql --help | more
mysql --help | grep "user"
man mysql
```



my.cnf
-----------------------------------

* Skapa en my.cnf
* Dubbelkolla radbrytning
* Fixa rättigheter
* `mysql --print-defaults`



SQL
-----------------------------------



### Ladda databasmodellen från `example/intro`

```
mysql -uroot -p < setup.sql
mysql -udbwebb -p < ddl.sql
```

```
mysql> source ddl.sql
mysql> source dml.sql
```



### Visa tabellstrukturen

```
help
show databases
show tables
explain <table>
show create table <table>
```



### Skapa nytt innehåll

```
insert into student values ('mumin', 'Mumintrollet');
insert into course values ('TRO101', 'Trollkunskap', 'trollis', 9.0);
```



### Joina 2 tabellerna

Joina student2course med course.

```
select * from student2course as sc, course as c;
select * from student2course as sc, course as c where c.code = sc.code;
select
    *
from student2course as sc
    inner join course as c
        on c.code = sc.code
;
select
    sc.*,
    c.nick
from student2course as sc
    inner join course as c
        on c.code = sc.code
;
```



### Skapa vy

Create a view.

```
create view s_studcourse
as
select
    sc.*,
    c.nick
from student2course as sc
    inner join course as c
        on c.code = sc.code
;
```



### Länka tabeller och joina tre tabeller

Lägg in mumin i nya kursen.

```
insert into student2course (acronym, code) values ('mumin', 'TRO101');
insert into student2course (acronym, code) values ('mumin', 'DV1606');
```

Ge mumin betyg.

```
update student2course set grade = 'E' where acronym='mumin';
update student2course set grade = NULL where acronym='mumin' and code='TRO101';
```

Joina tre tabeller.

```
select
    *
from student as s
    inner join student2course as sc
        on s.acronym = sc.acronym
;
```

```
select
    concat(name, ' (', s.acronym, ')') as name,
    sc.code,
    sc.grade
from student as s
    inner join student2course as sc
        on s.acronym = sc.acronym
;
```

```
select
    concat(s.name, ' (', s.acronym, ')') as name,
    sc.code,
    sc.grade,
    c.*
from student as s
    inner join student2course as sc
        on s.acronym = sc.acronym
    inner join course as c
        on sc.code = c.code
;
```

```
select
    concat(s.name, ' (', s.acronym, ')') as name,
    sc.code,
    sc.grade,
    c.nick,
    c.name
from student as s
    inner join student2course as sc
        on s.acronym = sc.acronym
    inner join course as c
        on sc.code = c.code
;
```

Create a view `v_report` of above query.



JavaScript
-----------------------------------

Skriv program med main, som läser in värde från tangentbordet och skriver ut.

Koppla till databas.

```
npm init
```

Prata om modul.
