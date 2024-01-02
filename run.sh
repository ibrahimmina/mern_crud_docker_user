#!/bin/bash

rundb=0
runserver=0
runclient=0
runBuild=0

export $(grep -v '^#' .env | xargs)



while [ -n "$1" ]; do # while loop starts
	case "$1" in
	-db) rundb=1 ;;
	-s) runserver=1 ;;
	-c) runclient=1 ;;
	-b) runBuild=1 ;;
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
	ClientMessage="RUNNING Development Environment"
elif [[ $env="prod" ]]; then
	ClientMessage="RUNNING Production Environment"
fi
RunCommand="docker-compose up -d"

if [[ $rundb=1 ]]; then
	ClientMessage=$ClientMessage$'\nRunning DB on Port '${MONGO_PORT}
	RunCommand=$RunCommand" mongo"
fi

if [["$runserver" = True]]; then
	ClientMessage=$ClientMessage"\nRunning Server on Port"
	RunCommand=$RunCommand" server"
fi

if [["$runclient" = True]]; then
	ClientMessage=$ClientMessage"\nRunning Client on Port"
	RunCommand=$RunCommand" client"
fi

if [["$runBuild" = True]]; then
	ClientMessage=$ClientMessage"\nRunning Build on Port"
	RunCommand=$RunCommand" --build"
fi

echo "$ClientMessage"
eval "$RunCommand"