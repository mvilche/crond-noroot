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
RUN apk add --update --no-cache curl tzdata && rm -rf /etc/localtime && mkdir -p /opt/crond /usr/share/crond /opt/custom_tasks && touch /etc/localtime /etc/timezone /usr/share/crond/tasks /opt/custom_tasks/tasks && \
chown 1001:1001 -R /etc/localtime /etc/timezone /usr/share/crond /opt/custom_tasks && chmod +x /usr/bin/go-crond
COPY run.sh /usr/bin/run.sh
USER 1001
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/share/crond/tasks"]
