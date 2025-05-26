### 250526
## 설치 패키지 정리
### Dockerfile 작성, container build 후 용량을 줄이기 위해 마지막에 수행한다.
```
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
```
