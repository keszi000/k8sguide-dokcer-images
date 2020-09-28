FROM jenkins/jenkins:2.235.1
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY config.yaml /var/jenkins_home/casc_configs/jenkins.yaml
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml

# skip setup wizard, see: https://github.com/jenkinsci/docker/blob/master/README.md#script-usage
RUN echo 2.235.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
