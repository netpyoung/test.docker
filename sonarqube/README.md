sonarqube
=========


�ٿ�ε� : http://www.sonarqube.org/downloads/


## docker-recipe example
* https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md


## tree
* %����% ������Ʈ��δ� sonar-scanner�� �ִ� bin������ �־�� �Ѵ�.

```
    .
    ����bin
    ��  ����sonar-scanner - ��������
    ����conf
    ��  ����sonar-scanner.properties - ��������
    ����lib
```

## sonar-scanner.properties
* sonarqube runner���� sonarqube scanner�� �̸� �ٲ۵�.
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