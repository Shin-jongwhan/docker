# root 로 실행되는 것을 개인 user 로 바꾸는 방법
### <br/><br/><br/>

## Dockerfile
### group 과 user 를 만들어준다.
### uid 는 서버에 /etc/passwd 에서 확인할 수 있다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/d78e0047-065d-49a5-bf38-331d96b26fd1)
```
ROM ubuntu:focal

RUN apt-get update -y
#RUN apt-get install -y git

# group uid, user uid can found from /etc/passwd
RUN groupadd -g 810810 bioinfo
RUN useradd -r -u 2100 -g bioinfo jhshin
USER jhshin
WORKDIR /home/jhshin
```
### <br/>

### build 
```
docker build -t shinejh0528/user_change_test .
```
### <br/>

### 접속
```
docker run -it -v /TBI/People/tbi/jhshin/script/docker/change_user_test:/home/jhshin/project shinejh0528/user_change_test
```
### <br/><br/><br/>

## docker 안에서 생성한 파일을 내 계정에서 조작할 수 있는지 확인
### 파일 생성
```
touch ~/project/test
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/1811fefc-e7b9-4eca-b977-f129ff4f8e24)
### <br/>

### 내 계정에서 조작 가능한지 확인하고, user, group 잘 들어가 있는지 확인
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/8279bb6e-d976-474b-a4ed-ed25d5a96e74)
### <br/><br/><br/>

## root 에서 작업
### root 에서 작업하고 chown 으로 바꿀 수 도 있다.
### <br/>

### Docker file 
```
FROM ubuntu:focal

RUN apt-get update -y
#RUN apt-get install -y git

# group uid, user uid can found from /etc/passwd
RUN groupadd -g 810810 bioinfo
RUN useradd -r -u 2100 -g bioinfo jhshin
#USER jhshin
#WORKDIR /home/jhshin
```
### <br/>

### docker 내에서 작업
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/9e426bc5-9138-46c4-8e87-e4cb19048cb9)
### <br/>

### 내 계정에서 삭제해보기
### 잘 삭제가 된다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/53a9083f-9419-4c54-bedc-e2a2f9253918)
