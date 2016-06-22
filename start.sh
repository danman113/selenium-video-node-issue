# start the daemon
docker-machine start
docker-machine env
eval "$(docker-machine env default)"

#Stops and removes all docker instances
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

#Starts the new docker instances
#Runs the hub on a random port
docker run -d -p 4444:4444 --name h1 hub

#Chrome node
docker run -d --link h1:hub --name c1 chrome

#Firefox node
docker run -d --link h1:hub --name f1 firefox

echo "#################################"
echo "#Docker hub started on port 4444#"
echo "#################################"