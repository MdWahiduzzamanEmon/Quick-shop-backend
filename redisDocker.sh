
# //start redis server with docker container


echo 'Do you want to start Redis server or Stop Redis server? (start/stop)'

read response

if [ $response == "start" ]
then
   
echo -e "Starting Redis Server with Docker Container"

# docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest

# ask for is user wants to remove the previous container and start a new one

echo "Do you want to remove the previous container and start a new one? (y/n)"

read response

# //ask for chnage in port number for redis server and redis commander server.if yes then remove the previous container and start a new one with new port number.else start the container with default port number.

echo "Do you want to change the port number for Redis Server? (y/n)"

read response

if [ $response == "y" ]
then
    echo "Enter the new port number for Redis Server:"

    read redisPort

    echo "Do you want to change the port number for Redis Commander Server? (y/n)"

    read response

    if [ $response == "y" ]
    then
        echo "Enter the new port number for Redis Commander Server:"

        read redisCommanderPort

        docker run -d --name redis-stack -p $redisPort:6379 -p $redisCommanderPort:8001 redis/redis-stack:latest
    else
        docker run -d --name redis-stack -p $redisPort:6379 -p 8001:8001 redis/redis-stack:latest
    fi
else
    echo "Do you want to change the port number for Redis Commander Server? (y/n)"

    read response

    if [ $response == "y" ]
    then
        echo "Enter the new port number for Redis Commander Server:"

        read redisCommanderPort

        docker run -d --name redis-stack -p 6379:6379 -p $redisCommanderPort:8001 redis/redis-stack:latest
    else
        docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
    fi
fi

echo "Redis Server is running on port 6379"
echo "Redis Commander Server is running on port 8001"

echo "Redis Server is running on port $redisPort"
echo "Redis Commander Server is running on port $redisCommanderPort"


else
    echo -e "Stopping Redis Server with Docker Container"
    docker stop redis-stack
    docker rm redis-stack
    echo "Redis Server is stopped"
fi
