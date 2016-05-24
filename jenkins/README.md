windows에서는 conemu랑 연결시킬것.



Tini - A tiny but valid init for containers
https://github.com/krallin/tini



[Thinking Inside the Container](http://engineering.riotgames.com/news/thinking-inside-container)



# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)


# Jenkins

https://hub.docker.com/_/jenkins/
https://github.com/jenkinsci/docker

https://github.com/maxfields2000/dockerjenkins_tutorial




http://stackoverflow.com/questions/7709993/how-can-i-update-jenkins-plugins-from-the-terminal

cd $JENKINS_HOME/plugins
curl -O http://updates.jenkins-ci.org/download/plugins/cobertura.hpi
curl http://yourservername:8080/reload


http://www.hugeinc.com/ideas/perspective/list-of-useful-jenkins-plugins

https://github.com/maxfields2000/dockerjenkins_tutorial


# Sonarqube