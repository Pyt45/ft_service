FROM alpine:latest

RUN apk update \
    && apk add wget

# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/telegraf-1.17.0-r0.apk --allow-untrusted --no-cache
# RUN tar zxvf telegraf-1.14.0-static_linux_amd64.tar.gz \
#     && rm -rf telegraf-1.14.0-static_linux_amd64.tar.gz

# RUN chmod +x telegraf/*
# RUN cp telegraf/telegraf /usr/bin/telegraf
# RUN mkdir -p /etc/telegraf
# RUN cp ./src/telegraf.conf /etc/telegraf/telegraf.conf
# ADD ./src/entry-point.sh /usr/bin/entry-point.sh
# RUN chmod +x /usr/bin/entry-point.sh

# ENTRYPOINT /usr/bin/entry-point.sh

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.17.0_linux_amd64.tar.gz > telegraf \
    && rm -rf telegraf-1.17.0_linux_amd64.tar.gz

RUN mkdir -p /etc/telegraf
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf


ADD ./src/entry-point.sh /usr/bin/entry-point.sh
RUN chmod +x /usr/bin/entry-point.sh

EXPOSE 8086
ENTRYPOINT /usr/bin/entry-point.sh