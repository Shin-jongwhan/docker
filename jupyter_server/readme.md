### 250612
## docker에서 jupyter notebook server 실행 방법
### 참고로 먼저 docker container 실행 시 -p 8888:8888 로 포트 연결해놔야 한다.
### <br/>

### 1. jupyter 설치
```
pip install notebook
```
### <br/>

### 2. jupyter server 실행
- --allow-root : root 권한으로 실행할 때 사용
- --ip=0.0.0.0 : 외부에서 접속할 떄 사용
- --port=8888 : 기본 포트
```
jupyter notebook --no-browser --port=8888 --ip=0.0.0.0 --allow-root
```
### <br/>

### 실행되면 이렇게 나온다.
#### ![image](https://github.com/user-attachments/assets/1aace34f-31ab-447a-8e65-2ff3fc53bf2b)
### 이 주소로 vscode에서 jupyter notebook을 하나 열고 실행하면, local에 연결할지, 아니면 server에 연결할지 물어보는데 이때 서버를 선택하고 위 주소를 입력한다.
#### ![image](https://github.com/user-attachments/assets/5b73ffd1-0224-498a-a1a1-70a2ecfc1ae2)
