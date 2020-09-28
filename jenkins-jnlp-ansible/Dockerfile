FROM jenkins/slave:latest
MAINTAINER Zsolt Fekete <pjtuxe@gmail.com>

USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
COPY passwd.template /usr/local/share/passwd.template

RUN apt-get update && apt-get install -y software-properties-common; \
    apt-add-repository -y ppa:ansible/ansible; \
    apt-get update && apt-get install -y libnss-wrapper gettext ca-certificates; \
    apt-get install -y ansible; \
    apt-get clean; \
    chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave; \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl; \
    mv kubectl /usr/bin/kubectl; \
    chmod +x /usr/bin/kubectl;

USER jenkins

ENTRYPOINT ["jenkins-slave"]
