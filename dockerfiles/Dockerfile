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
RUN apk add --update --no-cache curl tzdata && rm -rf /etc/localtime && mkdir -p /opt/crond && touch /opt/crond/crontab /etc/localtime /etc/timezone && \
chown 1001:1001 -R /opt/crond /etc/localtime /etc/timezone && chmod +x  /usr/bin/go-crond
COPY run.sh /usr/bin/run.sh
WORKDIR /opt/crond
USER 1001
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/crond/crontab"]
