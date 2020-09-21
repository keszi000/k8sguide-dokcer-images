FROM ubuntu:20.04

MAINTAINER keszi000@gmail.com

RUN apt-get update && \
    apt-get install -y curl \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

RUN apt-get update && \
    apt-get install -y git python3-pip python-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN curl https://pyenv.run | bash
RUN pip3 install --upgrade sphinx sphinx-autobuild sphinxcontrib-plantuml sphinxcontrib-blockdiag sphinxcontrib-seqdiag sphinx-jinja

ADD build /build
CMD /bin/bash /build
