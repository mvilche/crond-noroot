FROM alpine:3.10
USER root
RUN apk add --update --no-cache bash wget curl mailx shadow busybox-suid postgresql tzdata
RUN wget https://github.com/mvilche/go-crond/releases/download/0.6.3/go-crond && mv go-crond /usr/bin/go-crond && \
adduser -u 1001 -D crond && rm -rf /etc/localtime && mkdir -p /usr/share/crond /tmp/logs && \
touch /etc/localtime /etc/timezone && \
chown 1001 -R /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs && \
chgrp -R 0 /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs && \
chmod +x /usr/bin/go-crond && \
chmod -R g=u /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs
USER 1001
