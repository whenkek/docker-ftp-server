FROM alpine:latest
ENV FTP_USER=ftpuser \
	FTP_PASS=ftpuser\
	GID=1000 \
	UID=1000

RUN apk add --no-cache --update vsftpd

COPY [ "/src/vsftpd.conf", "/etc" ]
COPY [ "/src/docker-entrypoint.sh", "/" ]

CMD [ "/usr/sbin/vsftpd" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 20/tcp 21/tcp 40000-40009/tcp
HEALTHCHECK CMD netstat -lnt | grep :21 || exit 1
