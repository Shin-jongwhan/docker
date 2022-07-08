# created at 220708
## docker 관련 정리 repository

### <br/><br/><br/>

## 220708
### install docker image 
#### 이미지는 docker hub 에서 검색할 수 있다.
#### https://hub.docker.com/
#### <br/>
#### 이미지 설치는 docker pull \[이미지 명\]:\[version\]으로 한다.
#### $ docker pull python:3.9
#### <br/>

### docker run 방법
#### docker 실행은 docker run 으로 한다.
#### $ docker run python:3.9
#### <br/>
#### 명령어 전달은 뒤에 이어서 쓰고 기본 문법을 실행할 수 있다.
#### $ docker run python:3.9 python -c 'print("hello world!")'
![image](https://user-images.githubusercontent.com/62974484/177891673-5acbe326-a880-456f-961c-41562165eff5.png) <br/>
#### <br/>

### docker option
#### docker 옵션은 아래 사이트에서 잘 정리되어 있다.
https://wooono.tistory.com/348
#### 주로 쓰는 옵션은 -i, -t, -v, -p가 있다.
- \-i : 표준 입력(stdin)을 활성화 함. 이 명령어를 통해 docker container 안에서 bash 명령어를 쓸 수 있다.
- \-t : TTY (pseudo-TTY) 모드. \-i 옵션을 써서 bash 명령어를 쓰려면 이 옵션을 같이 써야 한다. **\-it** 와 같이 자주 쓴다.
- \-v : 운영체제의 디렉터리와 docker container 의 디렉터리를 연결한다. docker container 의 계정은 대부분이 root 이며 /root/ 가 홈 디렉터리이다. <br/> ex) $ docker run -it -v \[자신의 디렉터리\]:/root/project python:3.9 <br/> /root/project 디렉터리는 container 에 없는 디렉터리로 자동으로 만들어지며 container 를 종료할 시 사라진다.
- \-p : 운영체제의 port 와 container 의 포트를 각각 할당하여 연결한다. 서버 구동시 주로 활용한다. ex) -p 25565:25565
#### <br/>

### 활용
#### -v 옵션을 활용하여 docker container 에 스크립트를 실행할 수 있도록 할 수 있다.
#### ex) (-it 를 안 써도 실행은 되나 안 쓰면 stdout  프로그램이 모두 끝나고 보여준다.)
#### $ docker run -it -v /TBI/People/tbi/jhshin/script/test/docker:/root/project python:3.9 python /root/project/test.py
#### test.py
```
import glob
import os
import time

print("hello world !")
time.sleep(1)
print(os.system("python --version"))
```
#### docker 에서 실행했을 경우 python version
![image](https://user-images.githubusercontent.com/62974484/177893323-ff1f9ea0-28a0-4d06-a3af-76af92b782ad.png)
#### 운영체제 내 conda 환경에서 python version
![image](https://user-images.githubusercontent.com/62974484/177892938-76f4d5c9-8946-4801-92b1-0bb697b71d87.png)
#### <br/>
#### \-v 옵션은 여러 개 사용가능하다. 스크립트 경로와 파일 인식 등 원하는 경로를 한 번에 줄 수 있다. 아주 유용하다 !
#### test.py
```
import glob
import os
import time

print("hello world !")
time.sleep(1)
print(os.system("python --version"))

print(glob.glob("/root/project2/*"))
```
![image](https://user-images.githubusercontent.com/62974484/177893625-3aebaaf4-9446-4bc1-8d53-ebeb5f4a1cad.png)
#### <br/>

### docker image build 하는 방법
#### Dockerfile 이라는 파일을 준비한다. Dockerfile 은 Go 라는 언어로 작성된다.
```
FROM alpine
CMD ["echo", "Hello wolrd !"]
```
#### $ docker build -t \[원하는 이미지 명\] \[도커 파일 경로\]
#### ex) $ docker build -t jhshin_220708 . (.을 쓰면 ./Dockerfile 을 가리킨다)
#### 이미지 설치 확인 및 실행
![image](https://user-images.githubusercontent.com/62974484/177895321-355880cd-0c62-4724-99c5-730eff64eda9.png)
#### <br/>
