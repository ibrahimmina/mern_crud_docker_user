if [[ $1="dev" ]]; then
    echo "RUNNING DEV ENVIRONMENT"
    docker-compose up -d --build
elif [[ $1="prod" ]]; then
    echo "RUNNING PROD ENVIRONMENT"
    docker-compose up -d --build
else
    echo "ABORT WRONG ENVIRONMENT"
fi