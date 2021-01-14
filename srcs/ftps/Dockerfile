FROM alpine:latest

RUN apk add --no-cache vsftpd supervisor openssl openssh
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir -p /etc/telegraf

RUN adduser -D user
RUN echo "user:pass1234" | /usr/sbin/chpasswd
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem 

RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf \
    && echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
    && echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "xferlog_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "connect_from_port_20=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "xferlog_std_format=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ftpd_banner=WELCOME TO FTPS :)" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "listen=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "pam_service_name=vsftpd" >> /etc/vsftpd/vsftpd.conf \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_anon_ssl=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_private_key_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_address=192.168.99.234" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_min_port=21000" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_max_port=21000" >> /etc/vsftpd/vsftpd.conf

ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf

EXPOSE 21000
EXPOSE 21

ENTRYPOINT ["/usr/bin/supervisord"]