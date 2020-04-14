FROM jenkins/slave:latest
MAINTAINER Keszi <keszi000@gmail.com>
ARG CLOUD_SDK_VERSION=232.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

USER root

COPY jenkins-agent /usr/local/bin/jenkins-agent
COPY passwd.template /usr/local/share/passwd.template

RUN apt-get update && apt-get install -y libnss-wrapper gettext ca-certificates; \
    chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave; \
    export CLOUD_SDK_REPO="cloud-sdk-buster" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list; \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - ; \
    apt-get update; \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0; \
    gcloud config set core/disable_usage_reporting true; \
    gcloud config set component_manager/disable_update_check true; \
    gcloud config set metrics/environment github_docker_image; \
    gcloud --version; \
    apt-get clean;

USER jenkins

ENTRYPOINT ["jenkins-slave"]


