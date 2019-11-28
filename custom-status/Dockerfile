FROM alpine:3.10.1
MAINTAINER Keszi <gabor.keszeli@antavo.com>

RUN apk --update --no-cache add gettext nginx; \
    rm -rf /var/cache/apk/*; \
    rm -rf /etc/nginx/*; \
    mkdir -p /run/nginx;

ADD ./resources /

EXPOSE 80
CMD ["/entrypoint.sh"]
