FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add nginx openssh openrc curl

COPY ./src /root

RUN mkdir -p /run/nginx && \
    mkdir -p /www && \
    mv /root/index.html /www/index.html && \
    rm /etc/nginx/conf.d/default.conf && \
    mv /root/ft_services.conf /etc/nginx/conf.d/ft_services.conf

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 22
EXPOSE 80
EXPOSE 443

CMD "/root/entrypoint.sh"
