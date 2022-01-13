Databasteknologier för webben - databas
===================

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dbwebbse/databas?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=body_badge)
[![CircleCI](https://circleci.com/gh/dbwebb-se/databas.svg?style=svg)](https://circleci.com/gh/dbwebb-se/databas)
<!--
[![Build Status](https://travis-ci.org/dbwebb-se/databas.svg?branch=master)](https://travis-ci.org/dbwebb-se/databas)
-->

Course material for course "databas", aimed at a swedish target audience as an introduction to web programming for computer science students at University level.

Relased as part of a University course: https://dbwebb.se/kurser/databas

The course repo is managed by a [dbwebb command line utility](https://dbwebb.se/dbwebb-cli).



Running databases in docker-compose
-------------------

This is for those who knows how docker and docker-compose works.

The file `docker-compose.yaml` contains containers for the latest versions of `mysql` and `mariadb`.

You start them like this (perhaps add the option `-d` to run in the background).

```
docker-compose up mysql
# or
docker-compose up mariadb
```

The database server starts up. Review [`docker-compose.yaml`](docker-compose.yaml) for details on their setup.

Change `mysql` to `mariadb` to run the other container.

You can connect by starting the terminal client.

```
docker-compose run mysql mysql
# or
docker-compose run mariadb mysql
```

By default configuration, mysql client connects to the mysql database and mariadb client connects to the mariadb database. They run on the same port so you can not have them both active (by their default configuration).

It is preferred to use the following container when working as a user within the course.

```
docker-compose run databas mysql
# or
docker-compose run databas bash
$ mysql
```

This provides you with a tailored `~/.my.cnf` that works with the course repo and its databases.

You may upgrade or clean up the databases by removing their volume. Do like this.

```
# Stop and clean volumes
docker-compose down -v
```



Acknowledgement
-------------------

This is a co-effort of several people using freely available documentation and tools from the open source community.

For contributors, see the commit history and the issues.

Feel free to help building up the repository with more content suited for training and education.



```
 .
..:  Copyright (c) 2017-2021 dbwebb et al, info@dbwebb.se
```
