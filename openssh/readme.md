### 241117
## openssh 설정 방법
### 테스트 용도로 local에서 접속해서 하고 싶어서 내용을 정리하였다.
### <br/><br/>

## Dockerfile
```
# openssh
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Seoul apt-get -y install tzdata
RUN apt-get install -y openssh-server
#COPY sshd_config /etc/ssh/sshd_config
COPY sshd_config /usr/local/bin/sshd_config
ENV root_pw="root"

# ENTRYPOINT
COPY start_init.sh /usr/local/bin/start_init.sh
RUN chmod +x /usr/local/bin/start_init.sh
ENTRYPOINT ["/bin/bash", "/usr/local/bin/start_init.sh"]

```
### <br/><br/>

## sshd_config
### ssh config 파일
### root 계정에 접속할 수 있게 변경한 것이다.
### <br/><br/>

## start_init.sh
### ssh 서비스를 실행하고, root 비밀번호를 적용한다.
### 그리고 docker run에서 실행할 때 -e root_pw=\[pw\] 옵션을 준다면 원하는 비번으로 변경 가능하다.
### <br/><br/>

## 실행 및 접속 테스트
### docker run
```
docker run -itd -p 2022:22 --name test [container_name]
```
### <br/>

### putty 등에서 젒속을 시도해본다.
### 나는 2022번 포트를 사용하였다.
#### ![image](https://github.com/user-attachments/assets/26fa614b-c302-436a-aa38-de6bfdf75c31)
