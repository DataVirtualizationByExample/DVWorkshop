#######################################################################
#                                                                     #
# Creates a base CentOS 7 image with PostgreSQL                       #
#                                                                     #
#######################################################################

# Use the centos base image
FROM centos:centos7
MAINTAINER cvanball <cvanball@redhat.com>

# explicitly set user/group IDs
RUN groupadd -r postgres --gid=500 && useradd -r -g postgres --uid=500 postgres

# Update the system
RUN yum -y update;yum clean all
RUN yum -y install sudo epel-release; yum clean all
RUN yum -y install postgresql-common postgresql-server postgresql postgresql-contrib supervisor; yum clean all

RUN curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 -o /usr/local/sbin/gosu; \
   chmod 0755 /usr/local/sbin/gosu

########################
# Install PostgreSQL   #
########################
RUN mkdir /docker-entrypoint-initdb.d
RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

# PostgreSQL setup
ENV PGDATA /var/lib/pgsql/
ENV PGINST /usr/pgsql

COPY demo/financials-psql.sql /docker-entrypoint-initdb.d/financials-psql.sql

VOLUME ["/var/lib/psql"]

RUN rm -rf $PGDATA

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Expose ports
EXPOSE 5432

CMD ["postgres"]
