FROM jenkins/jenkins:lts-jdk11

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY jobs /usr/share/jenkins/ref/jobs
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Optional: Set timezone, if needed
# ENV TZ="America/New_York"
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
