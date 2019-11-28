FROM jenkins/slave:latest
MAINTAINER Keszi <keszi000@gmail.com>
ENV DOCKERVERSION=18.03.1-ce

USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
COPY passwd.template /usr/local/share/passwd.template

RUN apt-get update && apt-get install -y libnss-wrapper gettext; \
    apt-get clean; \
    chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave; \
    curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz && \
    tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker-${DOCKERVERSION}.tgz; \
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose; \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

USER jenkins
ENTRYPOINT ["jenkins-slave"]
