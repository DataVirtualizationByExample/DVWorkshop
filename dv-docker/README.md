## dv-docker
This project builds a docker container for running JBoss Data Virtualization 6.0.0.GA.

## Prerequisites
1. Install [Docker](https://www.docker.io/gettingstarted/#1)
2. Download JBoss Data Virtualization from [jboss.org.](http://jboss.org/products/#IBP)
2. Put the downloaded file: jboss-dv-installer-6.0.0.GA-redhat-4.jar into dv-docker/software
	
## Building the docker container locally
Once you have installed docker and downloaded the JBoss Data Virtualization software, you should be able to create the containers via the following:

If you are on OS X then see How to use [Docker on OS X.](https://github.com/fabric8io/fabric8-docker/blob/master/DockerOnOSX.md)

		$ docker build -t jbossdv600 . 

## Try it out
If you have docker installed you should be able to try it out via:

		$ cd dv-docker
		$ docker run -P -d -t jbossdv600 /bin/bash
        # /home/jboss/run.sh &

The run.sh sript will start the databases MySQL, PostgreSQL MongoDB and JBoss Data Virtualization 6.0.0.GA.

You can then noodle around the container and run stuff & look at files etc.
