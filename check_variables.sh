#!/bin/bash

#source
if [ -z "$MYSQL_SRC_HOST" ];
then
    echo "ERROR: Please set MYSQL_SRC_HOST variable";
    exit 1;
fi
if [ -z "$MYSQL_SRC_USER" ];
then
    echo "ERROR: Please set MYSQL_SRC_USER variable";
    exit 1;
fi
if [ -z "$MYSQL_SRC_DB" ];
then
    echo "ERROR: Please set MYSQL_SRC_DB variable";
    exit 1;
fi

#destination
if [ -z "$MYSQL_DEST_HOST" ];
then
    echo "ERROR: Please set MYSQL_DEST_HOST variable";
    exit 1;
fi
if [ -z "$MYSQL_DEST_USER" ];
then
    echo "ERROR: Please set MYSQL_DEST_USER variable";
    exit 1;
fi
if [ -z "$MYSQL_DEST_DB" ];
then
    echo "ERROR: Please set MYSQL_DEST_DB variable";
    exit 1;
fi