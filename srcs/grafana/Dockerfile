FROM alpine:latest
RUN apk update \
    && apk add wget
RUN wget http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/grafana-7.3.6-r0.apk
RUN apk add grafana-7.3.6-r0.apk
RUN apk update
RUN apk add --upgrade grafana

RUN mkdir -p /etc/grafana
ADD ./src/entry-point.sh /usr/bin/entry-point.sh
RUN chmod +x /usr/bin/entry-point.sh
# ADD ./src/grafana.ini /etc/grafana/grafana.ini

EXPOSE 3000
ENTRYPOINT /usr/bin/entry-point.sh