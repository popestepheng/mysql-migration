#!/bin/bash

sleep 5

./check_variables.sh &&
./fetch_from_target.sh &&
./restore.sh &&
echo "All done";