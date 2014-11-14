## dv-docker
This project builds a [docker](http://www.docker.io) PostgreSQL layer to be used by [JBoss Data Virtualization](http://http://www.redhat.com/products/jbossenterprisemiddleware/data-virtualization/) 6.0.0.GA.

## Prerequisitesd
1. Install [Docker](https://www.docker.io/gettingstarted/#1)
	
## Building the docker container locally
Once you have [installed docker](https://www.docker.io/gettingstarted/#h_installation), you should be able to create the PostgreSQL container via the following command:

If you are on OS X then see How to use [Docker on OS X.](https://github.com/fabric8io/fabric8-docker/blob/master/DockerOnOSX.md)

		$ docker build -t postgresql . 

The PostgreSQL container then build.

## Try it out
If you have docker installed you should be able to try it out via:

		$ cd dv-docker/postgresql-layer
		$ docker run -P -d -t postgresql 

This will run the psql container and starts automatically PostgreSQL.  You can then run **docker attach $containerID** or **docker logs -f $containerID**  to get the logs at any time.	

Run **docker ps** to see all the running containers or **docker inspect $containerID** to view the IP address and details of a container.

## Experimenting
To spin up a shell in the PostgreSQL containers try:

		$ docker run -P -i -t postgresql /bin/bash

You can then noodle around the container and run stuff & look at files etc.
