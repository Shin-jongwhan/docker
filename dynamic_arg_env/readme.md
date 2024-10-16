### 241016
## 변수 동적 처리
### 컨테이너를 실행하다 보면 port를 동적으로 설정해야 하거나, 웹 서버를 열 때 기본 아이디와 패스워드를 설정해야 하거나, 특정 config 파일을 복사해야 하거나 하는 등의 케이스들이 있다.
### 이럴 때 ENV를 사용하고, docker를 실행할 때 -e 옵션을 사용하면 된다.
### <br/><br/><br/>

## 예시
### start_nginx.sh
### 아래 sleep은 docker가 꺼지지 않게 한다.
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
### <br/>

### Dockerfile
```
# COPY custom nginx config and sites-available config dynamically
COPY start_nginx.sh /usr/local/bin/start_nginx.sh
RUN chmod +x /usr/local/bin/start_nginx.sh
ENV nginx_config /etc/nginx/nginx.conf
ENV nginx_sa /etc/nginx/sites-available/default

ENTRYPOINT ["/usr/local/bin/start_nginx.sh"]
```
### <br/>

### 실행
### -e 옵션으로 env를 변경한다.
```
docker run -itd -v /data:/data -e nginx_config=/data/nginx/config/nginx.conf -e nginx_sa=/data/nginx/sites-available/default_tgf shinejh0528/nginx:1.1.0
```
### <br/>

### 이렇게 하면 서버마다, 컨테이너마다 다른 설정이 필요하는 것을 처리할 수 있다.
