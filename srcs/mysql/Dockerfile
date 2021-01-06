FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add openrc mariadb mariadb-client --no-cache


# RUN rc-status
RUN openrc && touch /run/openrc/softlevel

# ADD ./src/my.cnf /etc/mysql/my.cnf
# RUN sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/" /etc/my.cnf.d/mariadb-server.cnf
ADD ./src/entry-point.sh /usr/bin/entry-point.sh
ADD ./src/create-admin.sh /usr/bin/create-admin.sh
RUN chmod +x /usr/bin/entry-point.sh
RUN chmod +x /usr/bin/create-admin.sh

EXPOSE 3306
ENTRYPOINT /usr/bin/entry-point.sh
# FROM alpine

# RUN apk update && \
#     apk upgrade && \
# 	apk add mysql mysql-client curl --no-cache

# COPY ./src/user.sh /usr/bin/user.sh
# RUN chmod +x /usr/bin/user.sh
# COPY ./src/my.cnf /etc/mysql/my.cnf
# # COPY ./src/wordpress.sql /wordpress.sql
