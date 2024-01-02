#!/bin/bash

rundb=False
runserver=False
runclient=False
runBuild=False


while [ -n "$1" ]; do # while loop starts
	case "$1" in
	-db) rundb=True ;;
	-s) runserver=True ;;
	-c) runclient=True ;;
	-b) runBuild=True ;;
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

if [["$rundb" = True]]; then
	ClientMessage=ClientMessage+"Running DB on Port"
	RunCommand=RunCommand+"mongo"
fi

if [["$runserver" = True]]; then
	ClientMessage=ClientMessage+"\n Running Server on Port"
	RunCommand=RunCommand+"server"
fi

if [["$runclient" = True]]; then
	ClientMessage=ClientMessage+"\n Running Client on Port"
	RunCommand=RunCommand+"client"
fi

if [["$runBuild" = True]]; then
	ClientMessage=ClientMessage+"\n Running Build on Port"
	RunCommand=RunCommand+"--build"
fi

echo $ClientMessage
echo $RunCommand