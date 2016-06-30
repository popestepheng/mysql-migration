#!/bin/bash
if [ -z "$MYSQL_SRC_HOST" ];
then
    echo "Please set MYSQL_SRC_HOST variable";
    exit 0;
fi
if [ -z "$MYSQL_SRC_USER" ];
then
    echo "Please set MYSQL_SRC_USER variable";
    exit 0;
fi
if [ -z "$MYSQL_SRC_DB" ];
then
    echo "Please set MYSQL_SRC_DB variable";
    exit 0;
fi

MYSQL_DUMP_CMD="mysqldump --add-drop-table --host=$MYSQL_SRC_HOST ";

if [ ! -z "$MYSQL_SRC_PORT" ];
then
    MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD --port=$MYSQL_SRC_PORT ";
fi

MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD --user=$MYSQL_SRC_USER ";

if [ ! -z "$MYSQL_SRC_PASSWORD" ];
then
    MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD --password=$MYSQL_SRC_PASSWORD";
fi

MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD $MYSQL_SRC_DB ";

if [ ! -z "$MYSQL_SRC_TABLES" ];
then
    MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD $MYSQL_SRC_TABLES";
fi

MYSQL_DUMP_CMD="$MYSQL_DUMP_CMD > ./backup/dump.sql";

eval $MYSQL_DUMP_CMD

