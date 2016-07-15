# mysql-migration

This image runs mysqldump to backup data from a source mysql server and imports it into a destination mysql server

## Usage:

    docker build -t mysql-migration .
    docker run -d \
        --env MYSQL_SRC_HOST="172.17.0.2" \
        --env MYSQL_SRC_PORT=3306 \
        --env MYSQL_SRC_USER="user" \
        --env MYSQL_SRC_PASSWORD="pass" \
        --env MYSQL_SRC_DB="my-db" \
        --env MYSQL_DEST_HOST="172.17.0.3" \
        --env MYSQL_DEST_PORT=3306 \
        --env MYSQL_DEST_USER="root" \
        --env MYSQL_DEST_PASSWORD="root" \
        --env MYSQL_DEST_DB="my-db-stage" \
        --env MYSQL_SRC_TABLES="entry invoice"
        mysql-migration

## Parameters

    MYSQL_SRC_HOST      the host/ip of your source mysql database
    MYSQL_SRC_PORT      the port number of your source mysql database
    MYSQL_SRC_USER      the username of your source mysql database
    MYSQL_SRC_PASSWORD  the password of your source mysql database
    MYSQL_SRC_DB        the database name to dump.
    MYSQL_SRC_TABLES    optional table names, if set, only these tables will get dumped/imported
    MYSQL_DEST_HOST     the host/ip of your destination mysql database
    MYSQL_DEST_PORT     the port number of your destination mysql database
    MYSQL_DEST_USER     the username of your destination mysql database
    MYSQL_DEST_PASSWORD the password of your destination mysql database
    MYSQL_DEST_DB       the database name to import.
 
