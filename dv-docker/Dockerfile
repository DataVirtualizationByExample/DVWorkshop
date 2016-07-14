# Use latest jboss/base-jdk:8 image as the base
FROM jboss/base-jdk:8

# Set the JDV_VERSION env variable
ENV EAP_VERSION 6.4.0
ENV JDV_VERSION 6.2.0.redhat-3
ENV JDV_HOME /opt/jboss/dv
ENV JDBC_HOME /opt/jboss/jdbc

RUN mkdir $JDV_HOME && mkdir $JDBC_HOME
# Upload required software and unzip DV server
COPY software/jboss-eap-$EAP_VERSION.zip $JDV_HOME
COPY software/jboss-dv-installer-$JDV_VERSION.jar $JDV_HOME
COPY software/dv-$JDV_VERSION-install.xml $JDV_HOME
COPY software/postgresql-9.4.1208.jar $JDBC_HOME 
COPY software/add-postgresql-jdbc-driver.cli $JDBC_HOME

USER root
RUN chown -R jboss:jboss $JDV_HOME
USER jboss
RUN cd $JDV_HOME && bsdtar -xf $JDV_HOME/jboss-eap-$EAP_VERSION.zip && java -jar $JDV_HOME/jboss-dv-installer-$JDV_VERSION.jar $JDV_HOME/dv-$JDV_VERSION-install.xml
RUN $JDV_HOME/jboss-eap-6.4/bin/standalone.sh & && $JDV_HOME/jboss-eap-6.4/bin/jboss-cli.sh --connect --file=$JDBC_HOME/add-postgresql-jdbc-driver.cli
# Remove required software binaries
RUN rm $JDV_HOME/jboss-eap-$EAP_VERSION.zip && rm $JDV_HOME/jboss-dv-installer-$JDV_VERSION.jar && rm $JDV_HOME/dv-$JDV_VERSION-install.xml && rm -rf $JDV_HOME/jboss-eap-6.4/standalone/configuration/standalone_xml_history/current

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose the ports we're interested in
EXPOSE 8080 9990 31000 35432

# Run JDV server and bind to all interface
CMD ["/opt/jboss/dv/jboss-eap-6.4/bin/standalone.sh","-b","0.0.0.0","-c","standalone.xml"]

