#!/bin/bash

while [ -n "$1" ]; do # while loop starts
	case "$1" in
	-db) rundb=True ;;
	-s) runserver=True ;;
	-c) runclient=True ;;
	--env)
        env=$2
		shift # The double dash makes them parameters
		;;
	*) echo "Option $1 not recognized" ;;
	esac
	shift
done

echo $env
echo $rundb
echo $runserver
echo $runclient

if [[ $env="dev" ]]; then
    echo "RUNNING DEV ENVIRONMENT"
    docker-compose up -d --build
elif [[ $env="prod" ]]; then
    echo "RUNNING PROD ENVIRONMENT"
    docker-compose up -d --build
else
    echo "ABORT WRONG ENVIRONMENT"
fi