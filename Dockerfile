FROM alpine:3.10
USER root
RUN apk add --update --no-cache bash wget curl mailx shadow busybox-suid postgresql tzdata
ADD https://github.com/mvilche/go-crond/releases/download/0.6.5/go-crond /usr/bin/
COPY run.sh /usr/bin/run.sh
RUN adduser -u 1001 -D crond && rm -rf /etc/localtime && mkdir -p /usr/share/crond /tmp/logs && \
touch /etc/localtime /etc/timezone && \
chown 1001 -R /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs /usr/bin/run.sh && \
chgrp -R 0 /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs /usr/bin/run.sh && \
chmod +x /usr/bin/go-crond /usr/bin/run.sh && \
chmod -R g=u /home/crond /etc/localtime /etc/timezone /usr/share/crond /usr/bin/go-crond /tmp/logs /usr/bin/run.sh
USER 1001
WORKDIR /usr/share/crond
ENTRYPOINT ["/usr/bin/run.sh"]