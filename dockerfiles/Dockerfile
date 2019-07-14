FROM golang:1.8-alpine AS builder
RUN apk add --update git && \
git clone https://github.com/mvilche/go-crond.git /go/src/go-crond
WORKDIR /go/src/go-crond
RUN go get \
    && go build \
    && chmod +x go-crond \
&& ./go-crond --version

FROM alpine:3.9
COPY --from=builder /go/src/go-crond/go-crond /usr/bin/go-crond
RUN apk add --update --no-cache curl postgresql tzdata
COPY run.sh /usr/bin/run.sh
RUN rm -rf /etc/localtime && mkdir -p /usr/share/crond && \
touch /etc/localtime /etc/timezone && \
chown 1001 -R /etc/localtime /etc/timezone /usr/share/crond && \
chgrp -R 0 /etc/localtime /etc/timezone /usr/share/crond && \
chmod +x /usr/bin/go-crond /usr/bin/run.sh && \
chmod -R g=u /etc/localtime /etc/timezone /usr/share/crond /usr/bin/run.sh 
USER 1001
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/share/crond"]
