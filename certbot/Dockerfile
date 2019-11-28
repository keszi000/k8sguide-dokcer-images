FROM alpine:3.10.1
MAINTAINER Keszi <keszi000@gmail.com>

RUN apk --update --no-cache add certbot python curl; \
    rm -rf /var/cache/apk/*; \
    mkdir /etc/letsencrypt;

ADD ./scripts/* /

CMD ["/entrypoint.sh"]
