FROM alpine:latest
RUN apk update \
    && apk add wget
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz \
    && mv grafana-7.3.6 grafana
RUN apk add libc6-compat telegraf supervisor
RUN mkdir -p /etc/telegraf \
    && mkdir -p /etc/grafana

ADD ./src/entry-point.sh /usr/bin/entry-point.sh
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/
RUN chmod +x /usr/bin/entry-point.sh
# ADD ./src/grafana.ini /etc/grafana/grafana.ini

EXPOSE 3000
ENTRYPOINT ["/usr/bin/supervisord"]