#!/usr/bin/env bash
if [ -f "software/jboss-datavirt-6.0.0.GA.zip" ]
then
	mv software/jboss-datavirt-6.0.0.GA.zip software/jboss-dv-installer-6.0.0.GA-redhat-4.jar
fi
if [ -f "software/jboss-dv-installer-6.0.0.GA-redhat-4.jar" ]
then
        
	echo "Building the JBoss Data Virtualization 6.0.0 container for workshop"
	docker build -t jbossdv600 .
else
	echo "File software/jboss-dv-installer-6.0.0.GA-redhat-4.jar not found."
        echo "Please download JBoss Data Virtualization 6.0.0.GA from http://jboss.org/products#IBP"
        exit 0
fi
