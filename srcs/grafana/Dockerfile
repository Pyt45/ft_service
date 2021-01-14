FROM alpine:latest
RUN apk update \
    && apk add wget
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz \
    && rm -rf grafana-7.3.6.linux-amd64.tar.gz \
    && mv grafana-7.3.6 grafana
RUN apk add libc6-compat telegraf supervisor
RUN mkdir -p /etc/telegraf \
    && mkdir -p /etc/grafana \
    && mkdir -p /etc/grafana/provisioning \
    && mkdir -p /etc/grafana/provisioning/dashboards \
    && mkdir -p /etc/grafana/provisioning/datasources

ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/
ADD ./src/grafana/dashboard.yaml /grafana/conf/provisioning/dashboards/
ADD ./src/grafana/datasource.yaml /grafana/conf/provisioning/datasources/
ADD ./src/panel/* /grafana/conf/provisioning/dashboards/

EXPOSE 3000
ENTRYPOINT ["/usr/bin/supervisord"]