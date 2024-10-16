### 241016
## docker run -itd가 꺼지지 않게 하는 방법
### docker를 빌드하는 과정에서 다른 스크립트를 실행할 때의 ENTRYPOINT 때문이다. 
### docker가 계속 실행하게끔 만들어야 한다면 쉘 스크립트로 무한 루프를 만들어줘야 한다.
### <br/>

#### start.sh
```
#!/bin/bash

# something commands...

while true; do
  sleep 3600;
done
```
### <br/>

### 그리고 Dockerfile에 다음과 같이 작성한다.
```
COPY start_nginx.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]
```
### <br/><br/><br/>

## docker 실행
### 참고로 뒤에 따로 /bin/bash 등 명령어를 사용하면 ENTRYPOINT가 변경되기 때문에 사용하면 안 되고, 별도로 docker exec로 접속해야 한다.
```
docker -itd [option] [container]
```
### <br/>

### 이렇게 계속 살아 있다.
#### ![image](https://github.com/user-attachments/assets/cbf6576b-4efc-41c5-8151-975bdf00b92f)
