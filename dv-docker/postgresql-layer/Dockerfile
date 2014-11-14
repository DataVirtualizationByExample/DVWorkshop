#######################################################################
#                                                                     #
# Creates a base CentOS image with PostgreSQL 9.3                     #
#                                                                     #
#######################################################################

# Use the centos base image
FROM centos

MAINTAINER cvanball <cvanball@redhat.com>
MAINTAINER kpeeples <kpeeples@redhat.com>

# Update the system
RUN yum -y update;yum clean all

##########################################################
# Install Java JDK, SSH and other useful cmdline utilities
##########################################################
RUN yum -y install which telnet unzip openssh-server sudo openssh-clients;yum clean all

# enable networking
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

#enable ssh access
RUN echo "sshd: ALL" > /etc/hosts.allow


########################
# Install PostgreSQL 9.3
########################
RUN yum -y install http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
RUN yum -y install postgresql93-server postgresql93-contrib;yum clean all
RUN service postgresql-9.3 initdb
RUN chkconfig postgresql-9.3 on

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

ADD demo/financials-psql.sql financials-psql.sql
RUN $PGINST/bin/pg_ctl start -w -D $PGDATA && \ 
    $PGINST/bin/psql -a -f financials-psql.sql

USER root
# Expose ports
EXPOSE 22 5432

USER postgres
CMD ["service sshd start;usr/pgsql-9.3/bin/postgres", "-D", "/var/lib/pgsql/9.3/data", "-c", "config_file=/var/lib/pgsql/9.3/data/postgresql.conf"]
 
# Finished
