#!/bin/bash

if [ ! -f ./backup/dump.sql ]; then
    echo "ERROR: No backup done!"
    exit 1;
fi

if [ -z "$MYSQL_SRC_TABLES" ];
then
    ./cleanup.sh
fi


MYSQL_IMPORT_CMD="mysql --host=$MYSQL_DEST_HOST "

if [ ! -z "$MYSQL_DEST_PORT" ];
then
    MYSQL_IMPORT_CMD="$MYSQL_IMPORT_CMD --port=$MYSQL_DEST_PORT ";
fi

MYSQL_IMPORT_CMD="$MYSQL_IMPORT_CMD --user=$MYSQL_DEST_USER ";

if [ ! -z "$MYSQL_DEST_PASSWORD" ];
then
    MYSQL_IMPORT_CMD="$MYSQL_IMPORT_CMD --password=$MYSQL_DEST_PASSWORD";
fi

MYSQL_IMPORT_CMD="$MYSQL_IMPORT_CMD $MYSQL_DEST_DB ";


MYSQL_IMPORT_CMD="$MYSQL_IMPORT_CMD < ./backup/dump.sql";

eval $MYSQL_IMPORT_CMD