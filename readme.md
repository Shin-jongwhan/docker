# created at 220708
## docker 관련 정리 repository

### <br/><br/><br/>

## 220708
## install docker image 
### 이미지는 docker hub 에서 검색할 수 있다.
### https://hub.docker.com/
### <br/>
### 이미지 설치는 docker pull \[이미지 명\]:\[version\]으로 한다.
```$ docker pull python:3.9```
### <br/>

## docker run 방법
### docker 실행은 docker run 으로 한다.
```$ docker run python:3.9```
### <br/>
### 명령어 전달은 뒤에 이어서 쓰고 기본 문법을 실행할 수 있다.
```$ docker run python:3.9 python -c 'print("hello world!")'```
![image](https://user-images.githubusercontent.com/62974484/177891673-5acbe326-a880-456f-961c-41562165eff5.png) <br/>
### <br/>

## docker option
### docker 옵션은 아래 사이트에서 잘 정리되어 있다.
https://wooono.tistory.com/348
### 주로 쓰는 옵션은 -i, -t, -v, -p가 있다.
- \-i : 표준 입력(stdin)을 활성화 함. 이 명령어를 통해 docker container 안에서 bash 명령어를 쓸 수 있다.
- \-t : TTY (pseudo-TTY) 모드. \-i 옵션을 써서 bash 명령어를 쓰려면 이 옵션을 같이 써야 한다. **\-it** 와 같이 자주 쓴다.
- \-v : 운영체제의 디렉터리와 docker container 의 디렉터리를 연결한다. docker container 의 계정은 대부분이 root 이며 /root/ 가 홈 디렉터리이다. <br/> ex) $ docker run -it -v \[자신의 디렉터리\]:/root/project python:3.9 <br/> /root/project 디렉터리는 container 에 없는 디렉터리로 자동으로 만들어지며 container 를 종료할 시 사라진다.
- \-p : 운영체제의 port 와 container 의 포트를 각각 할당하여 연결한다. 서버 구동시 주로 활용한다. ex) -p 25565:25565
### <br/>

## 활용
### -v 옵션을 활용하여 docker container 에 스크립트를 실행할 수 있도록 할 수 있다.
### ex) (-it 를 안 써도 실행은 되나 안 쓰면 stdout  프로그램이 모두 끝나고 보여준다.)
```$ docker run -it -v /TBI/People/tbi/jhshin/script/test/docker:/root/project python:3.9 python /root/project/test.py```
### test.py
```
import glob
import os
import time

print("hello world !")
time.sleep(1)
print(os.system("python --version"))
```
### docker 에서 실행했을 경우 python version
![image](https://user-images.githubusercontent.com/62974484/177893323-ff1f9ea0-28a0-4d06-a3af-76af92b782ad.png)
### 운영체제 내 conda 환경에서 python version
![image](https://user-images.githubusercontent.com/62974484/177892938-76f4d5c9-8946-4801-92b1-0bb697b71d87.png)
### <br/>
### \-v 옵션은 여러 개 사용가능하다. 스크립트 경로와 파일 인식 등 원하는 경로를 한 번에 줄 수 있다. 아주 유용하다 !
### test.py
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
### <br/>

## docker image build 하는 방법
### Dockerfile 이라는 파일을 준비한다. Dockerfile 은 Go 라는 언어로 작성된다.
```
FROM alpine
CMD ["echo", "Hello wolrd !"]
```
### $ docker build -t \[원하는 이미지 명\] \[도커 파일 경로\]
### ex) $ docker build -t jhshin_220708 . (.을 쓰면 ./Dockerfile 을 가리킨다)
### 이미지 설치 확인 및 실행
```
$ docker image ls
$ docker run [image 명]
```
![image](https://user-images.githubusercontent.com/62974484/177895321-355880cd-0c62-4724-99c5-730eff64eda9.png)
### <br/>

## docker system info
### 저장 공간 확인하기
```$ docker system df```
### docker 정보 확인하기
```$ docker system info```
#### 여기서 image 저장 경로도 확인할 수 있다.
![image](https://user-images.githubusercontent.com/62974484/177901305-ae80ebd4-30f7-4071-9423-7d8777b0d4af.png)
### <br/>

## delete docker image
### jhshin_220708 이라는 이미지가 있다.
![image](https://user-images.githubusercontent.com/62974484/177903089-8e6dcfd4-5236-4d98-a1b0-72f311b91839.png)
### 다음과 같이 입력하면 삭제된다. \-f 는 강제로 삭제(force) 옵션이다.
```
$ docker image rm -f [image 명]
```
### 삭제 후
![image](https://user-images.githubusercontent.com/62974484/177903246-a41c1f15-8d14-4182-9c69-1ca0613d0a6c.png)
### <br/>

## docker login
### 먼저 docker hub 에서 아이디를 만든다.
### 서버에서 도커 로그인
```
$ docker login
Username: shinejh0528
Password:
```
### * 만약 안 되면 다음과 같이 시도해본다
1. 자신의 홈 디렉토리에 .docker 폴더를 만들고 그 안에 config.json 파일을 빈 파일로 만든다.
2. 그 다음 다시 로그인을 시도해본다.
3. 안 되면 $ sudo apt-get install gnupg2 pass 2개 패키지를 설치한 후 시도해본다.
#### config.json 예시
```
{
    "auths": {
        "https://index.docker.io/v1/": {
            "auth": "lsdlfvmkasmfasmdfmsadlfm==blahblah"
        }
    }
}
```
### <br/>

## docker push
### 계정을 만들면 자신의 계정으로 push 하여 docker 파일을 저장할 수 있다.
1. docker hub 에서 repository 를 만든다.
![image](https://user-images.githubusercontent.com/62974484/177934399-a51ac644-d241-4895-b1db-f58937c85ca9.png) <br/>
2. \[자신의 계정명\]/\[repository\]:\[TAG\] 로 docker image 를 만든다. <br/>
ex) $ docker build -t shinejh0528/test:python_hello_world .
![image](https://user-images.githubusercontent.com/62974484/177934495-10cb6c0d-76de-4f59-b35e-d8bfa9ec7e01.png) <br/> 
3. docker push
```
docker push shinejh0528/test:python_hello_world
```
4. docker hub uoload 확인 <br/>
![image](https://user-images.githubusercontent.com/62974484/177935233-f077341c-a663-4a3b-9c0d-eb2751686dd4.png)
### <br/> 

------------------------------------------------------------------------------
# Dockerfile 세부 명령어 
### <br/><br/><br/>

## RUN, CMD
### RUN 과 CMD 가 종종 헷갈리는데, RUN 같은 경우는 docker build 를 할 때(컨테이너 생성할 때) 최초로 실행되는 명령어이다. 주로 컨테이너를 만들 때 sudo apt-get install ... 로 프로그램들을 설치할 때 사용한다.
### CMD 는 컨테이너가 만들어지고 난 후, 도커 실행 시에 처음으로 실행되는 명령어이다.
### <br/>
### Docker 파일 예시
```
FROM ubuntu:latest
RUN ["mkdir", "/root/project"]
CMD ["java", "-version"]
CMD ["echo", "Hello wolrd !"]
CMD ["bash"]
```
### $ docker images 또는 $ docker image ls 를 통해 ubuntu 가 pull 되었는지 확인
#### ![image](https://user-images.githubusercontent.com/62974484/205848365-72e81f28-4a54-47c2-bd70-748609292a4d.png)
### 빌드
```
$ docker build -t jhshin_221206 .
```
#### ![image](https://user-images.githubusercontent.com/62974484/205848550-92722441-dab5-4b5c-a9a1-258bbc3e995f.png)

