FROM ubuntu:20.04

RUN apt-get update; apt-get -y install jq curl;
COPY cf_ddns.sh /app/cf_ddns.sh
WORKDIR /app

CMD "/app/cf_ddns.sh"