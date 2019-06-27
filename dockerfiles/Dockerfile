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
RUN apk add --update --no-cache curl shadow tzdata && rm -rf /etc/localtime && mkdir -p /opt/crond /usr/share/crond /opt/custom_tasks && touch /etc/localtime /etc/timezone /usr/share/crond/tasks /opt/custom_tasks/tasks
COPY run.sh /usr/bin/run.sh
RUN adduser -D -u 1001 app && usermod -aG root app && chown app:0 -R /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks && chmod +x /usr/bin/go-crond /usr/bin/run.sh && \
chmod -R 0775 /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks /usr/bin/run.sh
USER app
ENV HOME /home/app
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/share/crond/tasks"]
