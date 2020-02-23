FROM alpine:3.11
USER root
RUN apk add --update --no-cache bash wget curl mailx shadow busybox-suid postgresql tzdata
ADD https://github.com/mvilche/go-tasks/releases/download/1.0.1/go-tasks /usr/bin/
COPY run.sh /usr/bin/run.sh
RUN adduser -u 1001 -D crond && rm -rf /etc/localtime && mkdir -p /opt/crontabs /opt/config /tmp/logs && \
touch /etc/localtime /etc/timezone && \
chown 1001 -R /home/crond /etc/localtime /etc/timezone /opt/crontabs /opt/config /usr/bin/go-tasks /tmp/logs /usr/bin/run.sh && \
chgrp -R 0 /home/crond /etc/localtime /etc/timezone /opt/crontabs /opt/config /usr/bin/go-tasks /tmp/logs /usr/bin/run.sh && \
chmod +x /usr/bin/go-tasks /usr/bin/run.sh && \
chmod -R g=u /home/crond /etc/localtime /etc/timezone /opt/crontabs /opt/config /usr/bin/go-tasks /tmp/logs /usr/bin/run.sh
USER 1001
WORKDIR /opt/crontabs
ENTRYPOINT ["/usr/bin/run.sh"]