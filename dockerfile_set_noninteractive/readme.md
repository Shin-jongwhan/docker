### 241117
## apt-get 설치 시 상호작용 스킵 방법
### 종종 apt-get install에서 나라 설정하라고 하면 에러가 나기 때문에, 다음과 같이 Dockerfile에 먼저 아래 명령어를 실행한다.
```
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Seoul apt-get -y install tzdata
```

