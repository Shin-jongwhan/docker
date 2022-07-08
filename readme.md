# created at 220708
## docker 관련 정리 repository

### <br/><br/><br/>

## 220708
### docker 에서 이미지 설치하는 방법
#### 이미지는 docker hub 에서 검색할 수 있다.
#### https://hub.docker.com/
#### <br/>
#### 이미지 설치는 docker pull \[이미지 명\]:\[version\]으로 한다.
#### $ docker pull python:3.9
#### <br/>
#### docker 실행은 docker run 으로 한다.
#### $ docker run python:3.9
#### <br/>
#### 명령어 전달은 뒤에 이어서 쓰고 기본 문법을 실행할 수 있다.
#### $ docker run python:3.9 python -c 'print("hello world!")'
![image](https://user-images.githubusercontent.com/62974484/177891673-5acbe326-a880-456f-961c-41562165eff5.png) <br/>
#### <br/>
#### docker 옵션은 아래 사이트에서 잘 정리되어 있다.
https://wooono.tistory.com/348
#### 주로 쓰는 옵션은 -i, -t, -v, -p가 있다.
- \-i : 표준 입력(stdin)을 활성화 함. 이 명령어를 통해 docker container 안에서 bash 명령어를 쓸 수 있다.
- \-t : TTY (pseudo-TTY) 모드. \-i 옵션을 써서 bash 명령어를 쓰려면 이 옵션을 같이 써야 한다. **\-it** 와 같이 자주 쓴다.
- \-v : 운영체제의 디렉터리와 docker container 의 디렉터리를 연결한다. docker container 의 계정은 대부분이 root 이며 /root/ 가 홈 디렉터리이다. <br/> ex) $ docker run -it -v \[자신의 디렉터리\]:/root/project python:3.9 <br/> /root/project 디렉터리는 container 에 없는 디렉터리로 자동으로 만들어지며 container 를 종료할 시 사라진다.
- \-p : 운영체제의 port 와 container 의 포트를 각각 할당하여 연결한다. 서버 구동시 주로 활용한다. ex) 25565:25565
#### <br/>
#### -v 옵션을 활용하여 docker container 에 스크립트를 실행할 수 있도록 할 수 있다.
#### ex) 
#### $ docker run -v /TBI/People/tbi/jhshin/script/test/docker:/root/project python:3.9 python /root/project/test.py
#### test.py
![image](https://user-images.githubusercontent.com/62974484/177892631-2414a677-2d6f-44ad-86ac-ffc830cf8bdb.png)
#### <br/>
