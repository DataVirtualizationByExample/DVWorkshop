# Use latest jboss/base-jdk:8 image as the base
FROM jboss/base-jdk:8

# Set the JDV_VERSION, JDV_HOME and JDBC_HOME env variables
ENV JDV_VERSION 6.3.0
ENV JBOSS_HOME /opt/jboss/dv

# Upload required software and unzip DV server
COPY software/jboss-dv-$JDV_VERSION-installer.jar $HOME  
COPY software/dv-6.3.0-install.xml $HOME 

RUN cd $HOME
RUN java -jar /opt/jboss/jboss-dv-6.3.0-installer.jar /opt/jboss/dv-6.3.0-install.xml  
# Remove required software binaries
RUN rm $HOME/jboss-dv-$JDV_VERSION-installer.jar \
    && rm $HOME/dv-$JDV_VERSION-install.xml \
    && rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose the ports we're interested in
EXPOSE 8080 9990 31000 35432

# Run JDV server and bind to all interface
CMD ["/opt/jboss/dv/bin/standalone.sh","-b","0.0.0.0","-c","standalone.xml"]

