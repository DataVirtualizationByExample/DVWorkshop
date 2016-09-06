#!/usr/bin/env bash
if [ -f "software/jboss-dv-6.3.0-installer.jar" ]
then
        
	echo "Building the JBoss Data Virtualization 6.3.0 container for workshop"
	docker build -t jbossdv630 .
else
	echo "File software/jboss-dv-6.3.0-installer.jar not found."
        echo "Please download JBoss Data Virtualization 6.3.0 from http://developers.redhat.com/products/datavirt/download"
        exit 0
fi
