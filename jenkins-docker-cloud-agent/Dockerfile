FROM benhall/dind-jenkins-agent

RUN rm -rf /etc/apt/sources.list.d/*; \
    apt-get update;\
    apt-get install -y software-properties-common wget; \
    add-apt-repository -y ppa:openjdk-r/ppa; \
    apt-get update; \
    apt-get install -y openjdk-13-jre; \
    apt-get clean; \
    wget https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz; \
    tar xzvf docker-18.06.1-ce.tgz; \
    rm -rf /usr/bin/docker; \
    sudo cp docker/* /usr/bin/ ; \
    usermod -a -G docker jenkins; \
    usermod -a -G sudo jenkins; \
    rm -rf /var/lib/apt/lists/*;
