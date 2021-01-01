FROM alpine

RUN apk update && \
    apk upgrade && \
	apk add mysql mysql-client curl --no-cache

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY my.cnf /etc/my.cnf
COPY wordpress.sql /wordpress.sql

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306

CMD ["/entrypoint.sh"]
