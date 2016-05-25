# test.docker

[Thinking Inside the Container](http://engineering.riotgames.com/news/thinking-inside-container)


```
docker exec -it CONTAINER bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```



* https://golang.org/pkg/path/filepath/#Match

* http://crosbymichael.com/dockerfile-best-practices.html
* http://crosbymichael.com/dockerfile-best-practices-take-2.html
* https://docs.docker.com/compose/compose-file/

%주의% windows에서는 conemu랑 연결시킬것.

# ETC
* Tini - A tiny but valid init for containers
  - https://github.com/krallin/tini


# REF
* http://pseg.or.kr/pseg/
* http://12factor.net/
