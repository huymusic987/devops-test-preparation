-d (or --detach): Run the container in the background.

-p (or --publish): Map ports from the container to your host machine.

--name: Give the container a specific name.

-e (or --env): Set environment variables.

-v (or --volume): Mount volumes (for persistent storage).

example:

docker run -d -p 8080:80 --name my-nginx nginx

docker stop [CONTAINER_NAME or CONTAINER_ID]

example:

docker stop my-nginx

docker rm [CONTAINER_NAME or CONTAINER_ID]

example:

docker rm my-nginx

# stop all running containers
docker kill $(docker ps -q)

# remove all containers
docker rm $(docker ps -a -q)

# list all containers status

docker ps -a

# =====================

nano docker-compose.yml

docker-compose up -d

docker-compose down