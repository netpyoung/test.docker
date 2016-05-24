sonarqube
=========


다운로드 : http://www.sonarqube.org/downloads/


## docker-recipe example
* https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md


## tree
* %주의% 프로젝트경로는 sonar-scanner가 있는 bin폴더에 있어야 한다.

```
    .
    ├─bin
    │  ├─sonar-scanner - 실행파일
    ├─conf
    │  ├─sonar-scanner.properties - 설정파일
    └─lib
```

## sonar-scanner.properties
* sonarqube runner에서 sonarqube scanner로 이름 바꾼듯.
* http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
* http://docs.sonarqube.org/display/SONAR/Analysis+Parameters


## sonar-scanner.properties example

```properties
sonar.host.url=http://192.168.99.100:9000/
sonar.sourceEncoding=UTF-8
sonar.projectKey=my:project
sonar.projectName=My project
sonar.projectVersion=1.0
sonar.sources=C:/Users/pyoung/Desktop/sonar-scanner-2.6.1/bin/unity.skeleton/skeleton/Assets
sonar.sourceEncoding=UTF-8
sonar.language=cs
```