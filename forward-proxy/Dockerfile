FROM alpine:3.10.1
MAINTAINER Keszi <keszi000@gmail.com>

RUN apk --update --no-cache add gettext nginx; \
    rm -rf /var/cache/apk/*; \
    rm -rf /etc/nginx/*; \
    mkdir -p /run/nginx;

COPY  resources/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx"]
