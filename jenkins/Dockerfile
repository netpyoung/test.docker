FROM ubuntu:16.04


# Install.
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y sudo
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl git htop man unzip vim wget
RUN apt-get install -y openjdk-8-jdk 
RUN rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates -f


# Environemnt
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000
ENV LANG=C.UTF-8
ENV JAVA_OPTS="-Xmx1024m"
ENV JENKINS_OPTS="--logfile=/var/jenkins_home/jenkins.log"
ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log

EXPOSE 8080
EXPOSE 50000


# add user = jenkins
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
VOLUME /var/jenkins_home


# add user = admin
RUN useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo


# install = jenkins
RUN mkdir -p /var/log/jenkins/
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d/
ARG JENKINS_VERSION
ENV JENKINS_VERSION ${JENKINS_VERSION:-2.6}
ARG JENKINS_SHA
ENV JENKINS_SHA ${JENKINS_SHA:-0c47582a44e73c4bcc2b1a67756503111ccd4b81}
ENV JENKINS_UC https://updates.jenkins.io

RUN curl -fsSL http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war -o /usr/share/jenkins/jenkins.war \
  && echo "$JENKINS_SHA /usr/share/jenkins/jenkins.war" | sha1sum -c -
RUN chown -R ${user} "$JENKINS_HOME" /usr/share/jenkins/ref
RUN chown -R ${user} "/var/log/jenkins/"


# Copy in local config filesfiles
COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy
COPY jenkins.sh /usr/local/bin/jenkins.sh
COPY plugins.sh /usr/local/bin/plugins.sh
RUN chmod +x /usr/local/bin/plugins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt

# Switch to the jenkins user
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
