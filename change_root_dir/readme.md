### 231006
## Docker Root Dir 바꾸는 방법
### <br/><br/><br/>

### 1. docker root dir 확인
```
docker info
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/af74d1c6-b552-4b64-b8eb-2f2eb593b18c)
### <br/>

### 2. 기존 docker root dir 를 다른 곳으로 복사
```
cp -r /var/snap/docker/common/var-lib-docker /data/docker/
```
### <br/>

### 3. /etc/docker/daemon.json 파일 수정
### docker 에 대한 설정 파일이다. docker root dir 를 적어준다.
```
{
        "data-root": "/data/docker/var-lib-docker"
}
```
### <br/>

### 4. docker service 재시작
### docker socket 도 같이 stop 해줘야 한다.
```
# docker service stop
systemctl disable docker.socket
systemctl stop docker.socket
systemctl stop docker.service

# docker status 확인 ( inactive (dead) )
systemctl status docker

# docker service 재시작
systemctl start docker.service

# docker status 확인 ( active (running) )
systemctl status docker
```
### 재시작 확인
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/6e3d338e-336b-4514-bd5f-55b37dd9e9d1)
### <br/>

### 5. docker root dir 바뀌었는지 확인
```
docker info
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/a811f543-6bf6-426c-8e91-a15bd9cf7cb6)
