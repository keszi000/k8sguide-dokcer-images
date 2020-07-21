FROM benhall/dind-jenkins-agent

RUN rm -rf /etc/apt/sources.list.d/*; \
    apt-get update;\
    apt-get install -y software-properties-common; \
    add-apt-repository -y ppa:openjdk-r/ppa; \
    apt-get update; \
    apt-get install -y openjdk-13-jre; \
    apt-get clean; \
    usermod -a -G docker jenkins; \
    usermod -a -G sudo jenkins; \
    rm -rf /var/lib/apt/lists/*;
