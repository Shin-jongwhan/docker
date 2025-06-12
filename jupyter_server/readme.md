### 250612
## docker에서 jupyter notebook server 실행 방법
### 참고로 먼저 docker container 실행 시 -p 8888:8888 로 포트 연결해놔야 한다.
### 머신 러닝에서 활용
- docker container는 환경 충돌이 빈번한 머신 러닝 container에서, 모델을 메모리에 올려두고 계속 사용하며 테스트할 때 유용하다.
- 그리고 tutorial, 사용 예제와 output, plot을 남기고 그 코드의 흐름을 남길 때 유용하다. 나중에 참고할 수 있다. 요즘 github repo에도 보면 이렇게 tutorial을 제공하는 케이스들이 늘어나고 있다. 또한 있으면 결과 확인에 매우 좋다.
- markdown으로 이 코드가 왜 사용되었는지 기록해두면 아주 좋은 참고 사항이 된다.
### <br/>

### 주의 사항
- 어디까지나 경량화된 테스트 용도나 튜토리얼을 구성할 때만 사용한다.
- jupyter notebook은 메모리 사용이 과다하고, cache를 계속 저장하기 때문에 디스크와 RAM 저장 문제가 생긴다. 사용 후에는 반드시 종료한다.
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
### <br/>
