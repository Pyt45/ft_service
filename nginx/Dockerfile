FROM alpine

# update and install nginx

RUN apk update
RUN apk add nginx

# setup nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY src/nginx.conf /etc/nginx/nginx.conf

# install openssl and generate ssl certificate

RUN apk add openssl
RUN yes "" | openssl req -x509 -nodes -days 365 \
 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key \
 -out /etc/ssl/certs/localhost.crt

# Setting up a ssh-server

RUN apk add openssh
# Enable the sshd service so that it starts at boot:
RUN rc-update add sshd
# List services to verify sshd is enabled:
RUN rc-status

# create a user

RUN adduser --disabled-password user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -t rsa -b 4096 -f /tmp/sshkey -q -N ""
# RUN ssh-keygen -A
#copy some file

COPY src/index.html /www/index.html
COPY src/run.sh /usr/bin/
RUN chmod +x /usr/bin/run.sh

# define port

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT /usr/bin/run.sh

# run this command
# docker build -t img_name .
# docker run -it --name img_name_container -p 80:80 -p 443:443 img_name
