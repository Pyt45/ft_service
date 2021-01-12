FROM alpine:latest

RUN apk add --no-cache vsftpd supervisor openssl openssh
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir -p /etc/telegraf

RUN adduser -D user
RUN echo "user:pass1234" | /usr/sbin/chpasswd
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem 

RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
    && echo "passwd_chroot_enable=yes" >> /etc/vsftpd/vsftpd.conf \
    && echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf \
    && echo 'pasv_enable=Yes' >> /etc/vsftpd/vsftpd.conf \
    && echo 'ssl_enable=YES' >> /etc/vsftpd/vsftpd.conf \
    && echo 'force_dot_files=YES' >> /etc/vsftpd/vsftpd.conf \
    && echo 'rsa_cert_file=/etc/ssl/private/vsftpd.pem' >> /etc/vsftpd/vsftpd.conf \
    && echo 'rsa_private_key_file=/etc/ssl/private/vsftpd.pem' >> /etc/vsftpd/vsftpd.conf \
    && echo 'allow_anon_ssl=NO' >> /etc/vsftpd/vsftpd.conf \
    && echo 'force_local_data_ssl=YES' >> /etc/vsftpd/vsftpd.conf \
    && echo 'force_local_logins_ssl=YES' >> /etc/vsftpd/vsftpd.conf \
    && echo 'ssl_tlsv1=YES' >> /etc/vsftpd/vsftpd.conf \
    && echo 'ssl_sslv2=NO' >> /etc/vsftpd/vsftpd.conf \
    && echo 'ssl_sslv3=NO' >> /etc/vsftpd/vsftpd.conf \
    && echo 'require_ssl_reuse=NO' >> /etc/vsftpd/vsftpd.conf \
    && echo 'pasv_max_port=10100' >> /etc/vsftpd/vsftpd.conf \
    && echo 'pasv_min_port=10090' >> /etc/vsftpd/vsftpd.conf \
    && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf

# ADD /src/run.sh /
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf
# RUN chmod +x run.sh

# EXPOSE 21 10090-10100
EXPOSE 21

ENTRYPOINT ["/usr/bin/supervisor"]