### 250114
## ENTRYPOINT workflow
### 별도의 쉘 스크립트를 실행하게 하는 구조로 하여 ENV를 사용하게 하는 목적으로 개발 워크플로우를 정리하였다.
### <br/><br/>

### 1. Dockerfile에 ENV 작성하는 부분에 사용할 ENV를 작성하여 build 한다.
```
# ENV
# ENV must has default value
#ENV test test
```
### <br/>

### 2. docker-entrypoint.sh에서 ENV를 사용한다.
```
echo $test
```
### <br/>

### 3. docker run 할 때 -e 옵션을 사용한다.
```
docker run -e test=test
```
