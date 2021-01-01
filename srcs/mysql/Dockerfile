# FROM alpine:latest

# RUN apk add openrc mysql mysql-client --no-cache
# RUN rc-status
# RUN touch /run/openrc/softlevel
# RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
# RUN rc-update add mariadb default
# ADD ./src/user.sh /usr/bin/user.sh
# RUN chmod +x /usr/bin/user.sh
# RUN rc-service mariadb start && /usr/bin/user.sh
# ADD ./src/run.sh /usr/bin/run.sh
# RUN chmod +x /usr/bin/run.sh
# ENTRYPOINT /usr/bin/run.sh
FROM alpine

RUN apk update && \
    apk upgrade && \
	apk add mysql mysql-client curl --no-cache

COPY user.sh /user.sh
RUN chmod +x /user.sh
COPY ./src/my.cnf /etc/my.cnf
# COPY wordpress.sql /wordpress.sql


EXPOSE 3306

CMD ["/user.sh"]