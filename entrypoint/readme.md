### 241117
## ENTRYPOINT
### ENTRYPOINT는 설정 안 해주면 기본값으로 된다.
### 그런데 만약에 별도로 service를 실행하게 만들어야 하는 경우는 쉘 스크립트 파일을 만들고 그것을 ENTRYPOINT로 잡아야 강제 종료가 되지 않는다.
### dockerfile 맨 마지막 부분에 다음과 같이 적어준다.
```
ENTRYPOINT ["/usr/local/bin/start_nginx.sh"]
```
### <br/>

### 그리고 .sh 파일은 다음과 같이 무한루프를 돌고 있어야 한다.
```
#!/bin/bash
cp ${nginx_config} /etc/nginx/nginx.conf
cp ${nginx_sa} /etc/nginx/sites-available/default
#nginx -g "daemon off;"
service nginx start

while true; do
  sleep 3600;
done

```
### <br/><br/><br/>

## .bashrc 사용하는 방법
### dockerfile에 .bashrc 부분에 추가적인 명령어가 실행되도록 써준다.
```
RUN echo "/bin/bash /root/smtp_init.sh" >> /root/.bashrc
```
### <br/><br/><br/>

## ENTRYPOINT와 .bashrc의 차이점
### ENTRYPOINT는 반드시 실행된다. 하지만 .bashrc는 (당연하게도) 쉘 환경을 쓰지 않는다면 실행되지 않는다.
### 그리고 단 한 번만 실행해야 하는 경우라면 ENTRYPOINT가 맞다. 쉘에 접근할 때마다 실행해야 하면 .bashrc가 맞겠지만...
### <br/>

### 하지만 쉘 스크립트의 목적은 보통 한 번만 실행해야 하는 경우가 많기 때문에 이런 경우 ENTRYPOINT가 적합한 방법일 것이다.
