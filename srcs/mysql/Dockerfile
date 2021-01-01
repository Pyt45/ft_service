FROM alpine:latest

RUN apk add mysql mysql-client --no-cache
RUN rc-status
RUN touch /run/openrc/softlevel
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN rc-update add mariadb default
ADD ./src/user.sh /usr/bin/user.sh
RUN chmod +x /usr/bin/user.sh
RUN rc-service mariadb start && /usr/bin/user.sh
ADD ./src/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
ENTRYPOINT /usr/bin/run.sh