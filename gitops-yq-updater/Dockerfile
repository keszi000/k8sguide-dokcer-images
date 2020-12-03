FROM alpine:3.12.1
MAINTAINER Keszi <keszi000@gmail.com>

RUN apk add git jq &&\
    wget https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
