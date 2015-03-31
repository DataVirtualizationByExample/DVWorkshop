#!/usr/bin/env bash
if [ -f "software/jboss-dv-installer-6.1.0.redhat-3.jar" ]
then
        
	echo "Building the JBoss Data Virtualization 6.1.0 container for workshop"
	docker build -t jbossdv610 .
else
	echo "File software/jboss-dv-installer-6.1.0.redhat-3.jar not found."
        echo "Please download JBoss Data Virtualization 6.1.0 from http://www.jboss.org/products/datavirt/overview/"
        exit 0
fi
