FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY src/nginx.conf /etc/nginx/nginx.conf
COPY src/index.html /www/index.html
COPY src/run.sh /usr/bin/
RUN chmod +x /usr/bin/run.sh
EXPOSE 80
EXPOSE 443
ENTRYPOINT sh /usr/bin/run.sh
