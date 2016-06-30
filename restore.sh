#!/bin/bash

if [ ! -f ./backup/dump.sql ]; then
    echo "ERROR: No backup done!"
    exit 0;
fi

if [ -z "$MYSQL_DEST_HOST" ];
then
    echo "Please set MYSQL_DEST_HOST variable";
    exit 0;
fi
if [ -z "$MYSQL_DEST_PORT" ];
then
    echo "Please set MYSQL_DEST_PORT variable";
    exit 0;
fi
if [ -z "$MYSQL_DEST_USER" ];
then
    echo "Please set MYSQL_DEST_USER variable";
    exit 0;
fi
if [ -z "$MYSQL_DEST_DB" ];
then
    echo "Please set MYSQL_DEST_DB variable";
    exit 0;
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