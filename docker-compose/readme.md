### 230816
# Docker compose
### 참고 사이트
- https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/What-is-Kubernetes-vs-Docker-Compose-How-these-DevOps-tools-compare
### <br/><br/><br/>

## Docker compose 란?
### single server 에서 orchastration 해주는 docker 에 내장된 도구이다.
### 쿠버네티스는 여러 서버를 하나의 컨트롤 플레인(전반적으로 관리해주는 관리자 역할)이 있고, 그 하위로 여러 서버에 worker node 들이 있다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/380cc775-084e-42d1-b5cc-c951ccefc8c1)
### <br/><br/><br/>

## 사용 방법
### docker-componse.yml 이라는 yaml 파일을 작성해야 한다고 한다.
### ex)
```
version: “3.9”
services:
  web:
    build: .
    ports:
      – “5000:5000”
    networks:
      – my_network
  redis:
   image: “redis:alpine”
   networks:
      – my_network
networks:
  my_network:
```
