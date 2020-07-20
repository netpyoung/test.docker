# test.docker


```
docker exec -it CONTAINER bash

# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```

jenkins
  - 8080 홈
  - 50000 마스터-에이전트
redmine
  - 41000
  - 41001

# Learn docker
* %주의% windows에서는 conemu랑 연결시킬것.
* [Thinking Inside the Container](http://engineering.riotgames.com/news/thinking-inside-container)
* http://crosbymichael.com/dockerfile-best-practices.html
* http://crosbymichael.com/dockerfile-best-practices-take-2.html
* https://docs.docker.com/compose/compose-file/
* https://golang.org/pkg/path/filepath/#Match


# REF
- https://ngrok.com/ - 외부 노출 url 테스트용

## Unity CacheServer
- https://github.com/Unity-Technologies/unity-cache-server
- https://github.com/windyakin/docker-unity-cache-server

## waiting
- https://github.com/ufoscout/docker-compose-wait
- https://github.com/vishnubob/wait-for-it
