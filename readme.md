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
#### docker run python:3.9
#### <br/>
#### 명령어 전달은 뒤에 이어서 쓰고 기본 문법을 실행할 수 있다.
#### docker run python:3.9 python -c 'print("hello world!")'
![image](https://user-images.githubusercontent.com/62974484/177891673-5acbe326-a880-456f-961c-41562165eff5.png) <br/>
