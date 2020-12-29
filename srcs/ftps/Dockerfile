FROM alpine:latest

RUN apk add vsftpd
RUN rc-update add vsftpd default
RUN rc-status
RUN touch /run/openrc/softlevel
RUN rc-service vsftpd restart
