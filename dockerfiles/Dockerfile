FROM golang:alpine AS builder
RUN apk add --update git && \
git clone https://github.com/mvilche/go-crond.git /go/src/go-crond
WORKDIR /go/src/go-crond
RUN go get \
    && go build \
    && chmod +x go-crond \
&& ./go-crond --version

FROM alpine:3.9
COPY --from=builder /go/src/go-crond/go-crond /usr/bin/go-crond
RUN apk add --update --no-cache curl shadow tzdata busybox-suid && rm -rf /etc/localtime && mkdir -p /opt/crond /usr/share/crond /opt/custom_tasks && touch /etc/localtime /etc/timezone /usr/share/crond/tasks /opt/custom_tasks/tasks
COPY run.sh /usr/bin/run.sh
RUN adduser -D crond && usermod -aG root crond && chown crond -R /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks && \
chgrp -R 0 /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks && \
chmod +x /usr/bin/go-crond /usr/bin/run.sh && \
chmod -R g=u /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks /usr/bin/run.sh && \
chmod 0644 -R /usr/share/crond/tasks
USER crond
ENV HOME /home/cron
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/share/crond/tasks"]
