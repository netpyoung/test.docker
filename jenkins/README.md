Jenkins
=======

* https://github.com/jenkinsci/docker

```
    ports:
      - "50000:50000"
      - "8080:8080"
    volumes:
      - "/c/Users/netpyoung/@DEVOPS/jenkins_home:/var/jenkins_home"
```

- `docker-compose.yml` 볼륨 확인하고
- `Dockerfile` plugins.txt확인
- `docker-compose up` 으로 기동
- `/var/jenkins_home/secrets/initialAdminPassword`
