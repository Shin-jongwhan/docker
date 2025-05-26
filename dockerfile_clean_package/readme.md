### 250526
## 설치 패키지 정리
### Dockerfile 작성, container build 후 용량을 줄이기 위해 마지막에 수행한다. 생각보다 크다 !
### 예시
```
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /root/.cache
```
