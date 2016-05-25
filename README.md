# test.docker


https://docs.docker.com/compose/compose-file/


docker exec -it CONTAINER bash

http://pseg.or.kr/pseg/



http://12factor.net/


windows에서는 conemu랑 연결시킬것.



Tini - A tiny but valid init for containers
https://github.com/krallin/tini



[Thinking Inside the Container](http://engineering.riotgames.com/news/thinking-inside-container)



# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
