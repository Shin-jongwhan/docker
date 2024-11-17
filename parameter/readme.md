### 241117
## docker 컨테이너 실행시 파라미터 주는 방법
### 파라미터를 받고, 실행하게 만들어주는 것은 컨테이너를 좀 더 유연하게 사용할 수 있게 만들어준다.
### 아래 docker hub를 참고하자
#### https://hub.docker.com/repository/docker/shinejh0528/nginx/general
### <br/>

### 다음과 같이 -e 옵션을 쓴다.
```
docker run -itd -v [data_dir]:[data_dir] -p 80:80 -p 443:443 -e nginx_config=[path_to]/nginx.conf -e nginx_sa=[path_to]/default_tgf --name [name] shinejh0528/nginx:1.1.0
```
### <br/>

### 그리고 ENTRYPOINT로 설정한 쉘 스크립트에서는 해당 env (파라미터)를 받은 걸로 실행하는 명령어를 써준다.
### 이렇게 하면 데이터베이스의 아이디, 비밀번호를 새롭게 설정하거나, config를 수정하거나 등등을 수행할 수 있다.
### 이것은 Dockerfile에서 COPY 명령어로 복사하여 사용한다.
```
cp ${nginx_config} /etc/nginx/nginx.conf
cp ${nginx_sa} /etc/nginx/sites-available/default

# 추가 명령어 실행
```
### <br/>

### 그런데 만약 -e 옵션으로 env 값을 주지 않았다면 어떻게 될까? 
### 에러가 날 것이기 때문에 default 값을 Dockerfile에 정의한다.
```
COPY start_nginx.sh /usr/local/bin/start_nginx.sh
#...

ENV nginx_config /etc/nginx/nginx.conf
ENV nginx_sa /etc/nginx/sites-available/default
#...

ENTRYPOINT ["/usr/local/bin/start_nginx.sh"]
```
