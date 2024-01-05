### 240105
## docker 에 유저 권한 추가 방법
### <br/>

### 이런 권한 에러가 뜨는 경우
```
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.40/images/json: dial unix /var/run/docker.sock: connect: permission denied
```

### 다음의 명령어로 docker group 에 user 를 추가해야 한다.
```
# docker group 추가 (생성되어 있다면 스킵)
sudo groupadd docker

# group 에 user 추가
sudo usermod -aG docker $USER

# group 변경 사항 적용
newgrp docker
```
