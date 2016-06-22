# selenium-video-node-issue

##What it is
I basically just ripped the dockerfiles from [docker-selenium](https://github.com/SeleniumHQ/docker-selenium/) (specifically the nodeHub,nodeBase,nodeChrome and nodeFirefox) and added a few shell scripts to build and start the docker nodes.

I built this on osx, so there might be some small issues with the commands I used on linux

##How to start it
First install docker on your machine.

Then simply run: 

`./buildContainers.sh`

This should download and install all of the dependencies (ubuntu, java, .etc) as well as install chrome.

Next run:

`./start.sh`

This will start the selenium-hub, and then start the firefox and chrome nodes and link them to the selenium-hub.

You can verify that these are working by running

```
#makes sure that docker is linked in your current enviroment
docker-machine start
docker-machine env
eval "$(docker-machine env default)"

#checks all docker processes
docker ps -a
```

##Getting the error
To actually get the chrome node to crash, send any google chrome test to the hub (to get the ip, run `docker-machine ip`).  
I used `python test_docker_video.py`.

This will crash the node. To get the logs from the crashed node run:

`docker logs c1`

This will copy the stdout of the docker-container running the chrome node to your stdout.

#Finally, thanks a lot aimmac23. I owe you a coffee.



