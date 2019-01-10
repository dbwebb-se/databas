Use MySQL/MariaDB with Docker
==============================

The idea is to run the database server in a docker container and access it from a external client.



Docker services for mysql and mariadb
----------------------------

The file `docker-compose.yaml` defines the services available. The service with the database server for MySQL is named `mysql` and `mariadb` for MariaDB. Docker volumes are used for persistent storage of the database content.

Files in `sql.d/` will be loaded when the container is setup for the first time. You need to clean old volumes if you want to re-setup and load the files again.

```text
# Init the container and read the files in sql.d/
docker-compose up -d mysql

# Stop and clean volumes
docker-compose down -v

# Do it all on one line
docker-compose down -v && docker-compose up -d mysql
```

There is one file in `sql.d/01_setup.sql` and it creates a user user:pass with access to a database "dbwebb". You need to edit the file if you are using MariaDB, since it is currently setup for MySQL, see the comments in the file.



Connect using a local client
---------------------------

When you have started the container you can connect either as root:password or as user:pass, using (for example) your own local client for `mysql`.

```text
# Connect as user:pass to database "dbwebb"
mysql --user=user --password=pass --host=127.0.0.1 --port=13306 dbwebb
mysql -uuser -ppass -h127.0.0.1 -P13306  dbwebb

# Connect as root:password
mysql --user=root --password=password --host=127.0.0.1 --port=13306
mysql -uroot -ppassword -h127.0.0.1 -P13306
```



Connect using a docker client
---------------------------

You can connect using a docker container for the mysql client. There are docker services defined for `mysql-client` and for `mariadb-client`. Run bash in either of them and then start the terminal client `mysql` or `mariadb`.

Here is using `mysql-client` and connecting to `mysql`.

```text
# Start a bash shell in the docker container
docker-compose run mysql-client bash

# Then run the client and connect to the named service
mysql -uuser -ppass -hmysql
```

Here is using `mariadb-client` and connecting to `mysql`.

```text
# Start a bash shell in the docker container
docker-compose run mariadb-client bash

# Then run the client and connect to the named service
mysql -uuser -ppass -hmysql
```



Known issues
---------------------------

Only tested on Debian/Linux. The volume and its persistence might work on macOS and Windows 10.

You might get an error message when you try to connect.

> ERROR 2013 (HY000): Lost connection to MySQL server at 'reading initial communication packet', system error: 0

Count to 10 and then try to connect again.
