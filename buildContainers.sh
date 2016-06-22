# start the daemon
docker-machine start
docker-machine env
eval "$(docker-machine env default)"

#Stops and removes all docker instances
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

#Builds containers
docker build -t hub hub/

docker build -t node node/

docker build -t firefox firefox/

docker build -t chrome chrome/