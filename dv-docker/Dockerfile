#######################################################################
#                                                                     #
# Creates a base CentOS image with JBoss Data Virtualization 6.0.0.GA #
#                                                                     #
#######################################################################

# Use the centos base image
FROM centos

MAINTAINER cvanball <cvanball@redhat.com>
MAINTAINER kpeeples <kpeeples@redhat.com>

# Update the system
RUN yum -y update;yum clean all

# enabling sudo group for jboss
RUN echo '%jboss ALL=(ALL) ALL' >> /etc/sudoers

# Create jboss user
RUN useradd -m -d /home/jboss -p jboss jboss


##########################################################
# Install Java JDK, SSH and other useful cmdline utilities
##########################################################
RUN yum -y install java-1.7.0-openjdk which telnet unzip openssh-server sudo openssh-clients;yum clean all
ENV JAVA_HOME /usr/lib/jvm/jre


######################
# Install MySQL Server
######################
RUN yum -y install mysql-server;yum clean all

# PostgreSQL setup
USER root
ADD demo/financials-mysql.sql financials-mysql.sql
RUN service mysqld start && \
    mysql -u root < financials-mysql.sql

# Install MySQL JDBC Client
RUN yum -y install mysql-connector-java;yum clean all


########################
# Install PostgreSQL 9.3
########################
RUN yum -y install http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
RUN yum -y install postgresql93-server postgresql93-contrib;yum clean all
RUN service postgresql-9.3 initdb

# PostgreSQL setup
USER postgres
ENV PGDATA /var/lib/pgsql/9.3/data
ENV PGINST /usr/pgsql-9.3

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
RUN echo "host    all         all         0.0.0.0/0               md5" >> $PGDATA/pg_hba.conf
RUN echo "" >> $PGDATA/pg_hba.conf
RUN echo "listen_addresses='*'" >> $PGDATA/postgresql.conf
RUN echo "" >> $PGDATA/postgresql.conf

# Start PostgreSQL
# Create a PostgreSQL role named ``jboss`` with ``jboss`` as the password and
# then create a database `jboss` owned by the ``jboss`` role.
ADD demo/financials-psql.sql financials-psql.sql
RUN $PGINST/bin/pg_ctl start -w -D $PGDATA && \ 
    $PGINST/bin/psql --command "CREATE USER jboss WITH SUPERUSER PASSWORD 'jboss';" && \
	$PGINST/bin/psql --command "CREATE DATABASE jboss WITH OWNER jboss;" && \
    $PGINST/bin/psql -a -f financials-psql.sql

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]


#################
# Install MongoDB
#################
USER root
# Setup mongodb yum repository
RUN echo "[mongodb]" > /etc/yum.repos.d/mongodb.repo
RUN echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb.repo
RUN echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/" >> /etc/yum.repos.d/mongodb.repo
RUN echo "gpgcheck=0" >> /etc/yum.repos.d/mongodb.repo
RUN echo "enabled=1" >> /etc/yum.repos.d/mongodb.repo
RUN yum -y install mongodb-org; yum clean all

# Increase ulimit
RUN echo "* soft nofile 4096" >> /etc/security/limits.conf
RUN echo "* hard nofile 4096" >> /etc/security/limits.conf


############################################
# Install JBoss Data Virtualization 6.0.0.GA
############################################
USER jboss
ENV INSTALLDIR /home/jboss/dv
ENV HOME /home/jboss
RUN mkdir $INSTALLDIR && \
   mkdir $INSTALLDIR/software && \
   mkdir $INSTALLDIR/support && \
   mkdir $INSTALLDIR/jdbc

ADD software/jboss-dv-installer-6.0.0.GA-redhat-4.jar $INSTALLDIR/software/jboss-dv-installer-6.0.0.GA-redhat-4.jar 
ADD support/teiid-security-users.properties $INSTALLDIR/support/teiid-security-users.properties
ADD support/teiid-security-roles.properties $INSTALLDIR/support/teiid-security-roles.properties
ADD support/InstallationScript.xml $INSTALLDIR/support/InstallationScript.xml

RUN java -jar $INSTALLDIR/software/jboss-dv-installer-6.0.0.GA-redhat-4.jar $INSTALLDIR/support/InstallationScript.xml
RUN mv $INSTALLDIR/support/teiid* $INSTALLDIR/jboss-eap-6.1/standalone/configuration
RUN curl -o $INSTALLDIR/jdbc/postgresql-9.3-1101.jdbc41.jar http://jdbc.postgresql.org/download/postgresql-9.3-1101.jdbc41.jar
RUN rm -rf $INSTALLDIR/jboss-eap-6.1/standalone/configuration/standalone_xml_history/current

# Command line shortcuts
RUN echo "export JAVA_HOME=/usr/lib/jvm/jre" >> $HOME/.bash_profile
RUN echo "alias ll='ls -l --color=auto'" >> $HOME/.bash_profile
RUN echo "alias grep='grep --color=auto'" >> $HOME/.bash_profile
RUN echo "alias c='clear'" >> $HOME/.bash_profile
RUN echo "alias sdv='$HOME/dv/jboss-eap-6.1/bin/standalone.sh -c standalone.xml'" >> $HOME/.bash_profile
RUN echo "alias xdv='$HOME/dv/jboss-eap-6.1/bin/jboss-cli.sh --commands=connect,:shutdown'" >> $HOME/.bash_profile

# start.sh
USER root
RUN echo "echo # JBoss Data Virtualization Start script" > $HOME/run.sh
RUN echo "service mysqld start " >> $HOME/run.sh
RUN echo "service postgresql-9.3 start " >> $HOME/run.sh
RUN echo "service mongod start " >> $HOME/run.sh
RUN echo "runuser -l jboss -c '$HOME/dv/jboss-eap-6.1/bin/standalone.sh -c standalone.xml -b 0.0.0.0 -bmanagement 0.0.0.0'" >> $HOME/run.sh
RUN chmod +x $HOME/run.sh

# Clean up
RUN rm -rf $INSTALLDIR/support
RUN rm -rf $INSTALLDIR/software
RUN rm financials-mysql.sql
RUN rm financials-psql.sql

EXPOSE 22 5432 8080 9990 27017

# Finished
