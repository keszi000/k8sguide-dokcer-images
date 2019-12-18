FROM jenkins/slave:latest
MAINTAINER Keszi <keszi000@gmail.com>

USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
COPY passwd.template /usr/local/share/passwd.template

RUN apt-get update && apt-get install -y libnss-wrapper gettext ca-certificates; \
    apt-get clean; \
    chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave; \
    wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz; \
    tar -zxf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz; \
    mv openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/bin/kubectl; \
    mv openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc  /usr/bin/oc; \
    rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit; \
    rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz; \
    chmod +x /usr/bin/kubectl; \
    chmod +x /usr/bin/oc;

USER jenkins

ENTRYPOINT ["jenkins-slave"]
