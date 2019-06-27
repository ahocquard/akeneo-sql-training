# SQL training

Presentation keynote done by Grégoire Hubert :)

## Installation

Start the containers:
```
export $(cat .env)
docker-compose up -d
docker-compose run php composer install
```

The Mysql container has already an icecat catalog loaded.

## Connect to Mysql

If you have the Mysql client:
```
mysql -h $DOCKER_HOST_IP -P $MYSQL_EXPOSED_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
```

If you don't have the Mysql client because you execute everything with docker:

```
docker run -it --rm mysql:5.7.22 sh -c "exec mysql -h $DOCKER_HOST_IP -P $MYSQL_EXPOSED_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE"
```

You can also use a GUI to have an history, table names, multi-lines edition, etc.

## Run the tests for the exercises

```
docker-compose run php vendor/bin/behat -v

```
