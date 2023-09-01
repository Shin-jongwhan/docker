### 230817
## docker volume (container)
### 참고 사이트
### 아래는 docker volume 을 생성하고 docker container 를 실행하는 내용을 다룬다.
- https://rondeveloper.tistory.com/92#2.1.%20volume%20%EC%83%9D%EC%84%B1
- https://www.daleseo.com/docker-volumes-bind-mounts/
### 아래는 docker volume 을 생성하고, docker-compose 에서 mysql 을 실행하는 방법을 다룬다.
- https://joont92.github.io/docker/volume-container-%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0/
### <br/><br/><br/>

## volume 생성 및 조회
### volume 생성
```
docker volume create jhshin_test
```
### <br/>

### volume 목록 조회
```
docker volume ls
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/09443110-ae6c-4d57-893b-34f9098298c0)
### <br/>

### docker volume 상세 정보
### 기본적으로 docker volume 은 /var/lib/docker/volumes 경로에 생긴다.
```
docker volume inspect jhshin_test
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/f933c178-dc26-4eee-917f-1dcd2d6bcf48)
### <br/><br/><br/>

## docker container 에 마운트하여 사용하기
### -v 옵션으로 마운트할 수 있다. 
```
docker run -it -v jhshin_test:/app shinejh0528/jhshin_base:theragenbio.1.0.0 /bin/bash
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/edf834af-90e3-444e-a2df-6dedac2d1cee)
### <br/>

### docker container 를 나간 다음에, 다시 접속해서 확인해보자.
### 그러면 아까 생성한 test 파일이 그대로 있을 것이다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/737a7acb-96eb-4265-a122-d051182954a6)
### <br/><br/><br/>

## volume 삭제
```
docker volume rm jhshin_test
```
