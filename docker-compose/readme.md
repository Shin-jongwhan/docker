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

## docker-componse.yml
### docker compose 를 사용하려면 docker-componse.yml 이라는 yaml 파일을 작성해야 한다고 한다.
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
### <br/><br/><br/>

## 위 docker compose yaml 설명
### docker compose 를 실행하면, redis 와 web 2 가지 서비스를 실행한다.
#### * redis 는 "키-값" 구조의 비정형 데이터를 저장하고 관리하기 위한 오픈 소스 기반의 비관계형 데이터베이스 관리 시스템이다.
### 네트워크는 docker 에서 격리되고 그 격리되어 주어진 네트워크 안에서 docker 가 실행이 된다.
### 이것에 대한 설정은 docker-componse.yml 에서 한다. network 범위와 network 이름을 쓸 수 있다.
### web 의 경우 5000:5000 으로 네트워크를 연결했기에, 5000 port 로 접근할 수 있다.
### <br/><br/><br/>

## docker compose VS kubernetes
### 🐳 docker compose
### docker compose 를 기반으로, 그 안에 있는 네트워크 범위로 여러 서비스를 정의할 수 있다.
### docker compose 는 하나의 서버(single server)에서 '여러 container 를 사용'하여 여러 서비스를 하나의 묶음인 서비스로 정의할 때 사용한다.
### <br/>

### 🎡 kubernetes
### run containers as service 라고 요약할 수 있다.
### 하나의 서버 또는 여러 서버 or machine 에서 실행한다.

