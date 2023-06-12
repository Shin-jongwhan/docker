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
```
$ docker run python:3.9 python -c 'print("hello world!")'
```
#### ![image](https://user-images.githubusercontent.com/62974484/177891673-5acbe326-a880-456f-961c-41562165eff5.png)
### <br/>

### 백그라운드로 실행하여 docker 터미널로 들어가게 만들고 싶을 경우
```
# background 실행
docker run -it -d --name jhshin_test bigdatarndtheragenbio/jhshin_array_test_230612:latest

# docker 접속
docker exec -it jhshin_test /bin/bash
```
### <br/><br/><br/>

## docker option
### docker 옵션은 아래 사이트에서 잘 정리되어 있다.
https://wooono.tistory.com/348
### 주로 쓰는 옵션은 -i, -t, -v, -p가 있다.
- \-i : 표준 입력(stdin)을 활성화 함. 이 명령어를 통해 docker container 안에서 bash 명령어를 쓸 수 있다.
- \-t : TTY (pseudo-TTY) 모드. \-i 옵션을 써서 bash 명령어를 쓰려면 이 옵션을 같이 써야 한다. **\-it** 와 같이 자주 쓴다.
- \-v : 운영체제의 디렉터리와 docker container 의 디렉터리를 연결한다. docker container 의 계정은 대부분이 root 이며 /root/ 가 홈 디렉터리이다. <br/> ex) $ docker run -it -v \[자신의 디렉터리\]:/root/project python:3.9 <br/> /root/project 디렉터리는 container 에 없는 디렉터리로 자동으로 만들어지며 container 를 종료할 시 사라진다.
- \-p : 운영체제의 port 와 container 의 포트를 각각 할당하여 연결한다. 서버 구동시 주로 활용한다. ex) -p 25565:25565
### <br/><br/><br/>

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
### <br/><br/>
### 여러 개 명령어 전달
### && 으로 명령어를 전달하면 도커에서 && 을 인식하는 것이 아니라 현재 리눅스 쉘에서 && 으로 인식하기 때문에 안 된다.
### sh -c \"command\" 로 묶어서 전달해야 한다.
```
$ docker run -it -v /TBI/People/tbi/jhshin/script/docker/java/java:/root/project shinejh0528/java:latest sh -c "cd /root/project; java Helloworld"
```
### 결과
#### ![image](https://user-images.githubusercontent.com/62974484/206057713-a6559092-be90-48a1-9488-325b3a9899e7.png)
### <br/><br/><br/>

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
### <br/><br/><br/>

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
### <br/><br/><br/>

## delete docker container
### docker ps 로 실행 중인 container 를 확인하고, tag 명으로 실행을 중지한다.
### -f 옵션을 쓰면 강제로 삭제시킨다.
```
docker rm [tag]
```
### <br/><br/><br/>

## 이미지 이름 변경
### 이름 변경 시 아래와 같이 한다.
#### $ docker image tag \[이전 이름\]:\[ver\] \[변경할 이름\]:\[ver\]
```
$ docker image tag jhshin-java:latest jhshin-java7:latest
```
### 하지만 이렇게 하면 이전 repo 이름이 남아 있기 때문에 지워줘야 한다.
#### ![image](https://user-images.githubusercontent.com/62974484/206047911-218d1b6d-2788-44ac-adc0-27535e9d4922.png)
#### $ docker rmi \[태그명\]
```
$ docker rmi -f jhshin-java7:latest
```
### 삭제 확인
#### ![image](https://user-images.githubusercontent.com/62974484/206048010-6cf743d4-0a61-4d6b-b400-2a9919604633.png)
### <br/><br/><br/>

## docker login
### 먼저 docker hub 에서 아이디를 만든다.
### 서버에서 도커 로그인
```
$ docker login
Username: shinejh0528
Password:
```
### * 만약 안 되면 다음과 같이 시도해본다
1. 자신의 홈 디렉토리에 .docker 폴더를 만들고 그 안에 config.json 파일을 아래 내용으로 만든다. auth 내용은 아무거나 해도 상관 없다.
```
{
    "auths": {
        "https://index.docker.io/v1/": {
            "auth": "wwasdfasdfasf"
        }
    }
}
```
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
# Dockerfile
### <br/><br/><br/>

## RUN, CMD
### RUN 과 CMD 가 종종 헷갈리는데, RUN 같은 경우는 docker build 를 할 때(컨테이너 생성할 때) 최초로 실행되는 명령어이다. 주로 컨테이너를 만들 때 sudo apt-get install ... 로 프로그램들을 설치할 때 사용한다.
### CMD 는 컨테이너가 만들어지고 난 후, 도커 실행 시에 처음으로 실행되는 명령어이다.
### <br/>
### Docker 파일 예시
#### 마지막에 CMD \["bash"\] 는 docker run -it \[컨테이너 이름\]:\[버전\] 으로 컨테이너 실행 시 docker 안에 리눅스 쉘을 유지하도록 한다.
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
### 접속
```
$ docker run -it jhshin_221206
```
### /root/project 디렉터리가 만들어진 것을 알 수 있다.
#### ![image](https://user-images.githubusercontent.com/62974484/205849008-c2988f30-c16d-40d6-a7f4-46abd8422422.png)
### <br/>

### 포트 연결하는 방법은 다음과 같이 한다.
### -e 옵션
- -e, --env list : Set environment variables
### --name 이라는 옵션으로 container 에 tag 를 달아줄 수 있다.
```
docker run -d -p 8787:8787 -e USER=rstudio -e PASSWORD=Rstudio@123 --name jhshin_test theragenbi/scrna_rstudio:1.0
```
### <br/><br/><br/>

## 패키지 설치
```
FROM ubuntu:latest
RUN ["mkdir", "/root/project"]
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3
CMD ["python3", "--vercion"]
CMD ["echo", "Hello wolrd !"]
CMD ["bash"]
```
```
$ docker build -t jhshin_221206 .
```
```
$ docker run -it jhshin_221206
```
#### ![image](https://user-images.githubusercontent.com/62974484/205853283-89c739eb-eba2-4be1-b790-8eea11411a11.png)
### <br/>

### `파일로 패키지를 설치하는 방법`
### Dockerfile 경로에 설치하고 싶은 스크립트를 작성한다.
```
#!/usr/bin/env Rscript

# R script to install requirements for exercises -------------------------------

## a vector of packages to install (edit in this section) ----------------------
### packages could be either on CRAN or bioconductor


install.packages(c('cluster', 'lattice', 'mgcv', 'nlme', 'rpart', 'survival', 'MASS', 'class', 'nnet', 'Matrix', 'KernSmooth', 'codetools', 'foreign', 'boot', 'HGNChelper', 'openxlsx','tidyverse', 'metap'), repos='https://cran-archive.r-project.org')

pkgs <- c("ggplot2", "BiocManager", "sctransform",
                   "devtools", "cowplot", "matrixStats",
                   "ggbeeswarm", "ggnewscale", "msigdbr", "ggrastr",
                   "Seurat", "bit64", "scater",
                   "AnnotationDbi",
                    "SingleR", "clusterProfiler", "celldex",
                    "dittoSeq", "DelayedArray",
                    "DelayedMatrixStats",
                    "limma", "SingleCellExperiment",
                    "SummarizedExperiment",
                    "slingshot", "batchelor",
                    "clustree", "edgeR", "TCC", "ComplexHeatmap", "DESeq2", "ExperimentHub", "pheatmap", "dplyr", "stringr", "gridExtra","ggraph", "data.tree", "metap")

### if packages need to be installed from github:
### devtools::install_github("namespace/repo")

## install Bioconductor --------------------------------------------------------
if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

## install and check package loading -------------------------------------------
for (pkg in basename(pkgs)) {
    BiocManager::install(pkg, ask = FALSE, update = FALSE)

    if (! library(pkg, character.only = TRUE, logical.return = TRUE)) {
        write(paste0("Installation of package ",
                     pkg,
                     " exited with non-zero exit status"),
                     stdout())
        quit(status = 1, save = "no")
    }
}
```
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/2813367a-91b8-45db-a5ef-1e955d7ba472)
### Dockerfile 에 해당 파일을 복사하고, 설치하는 명령어를 작성한다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/3ae10599-fd19-4776-84a8-c0c41a1efb1f)
### <br/><br/><br/>

### .bashrc, .vimrc 를 구성할 수도 있다.
#### * 주의사항은 Dockerfile 은 맨 앞 # 을 \"\" 안에 있어도 newline 으로 들어가면 주석 처리가 되니 따로 써줘야 한다.
### 아래 예시는 .bashrc 에 PS1, alias 를 구성, .vimrc 를 작성한 것이다.
```
# PS1 settings. split echo because of '#' error
RUN echo -e "# set variable identifying the chroot you work in (used in the prompt below)\n\
if [ -z \"\${debian_chroot:-}\" ] && [ -r /etc/debian_chroot ]; then\n\
    debian_chroot=\$(cat /etc/debian_chroot)\n\
fi\n" \
>> ~/.bashrc
RUN echo -e "# set a fancy prompt (non-color, unless we know we \"want\" color)\n\
case \"\$TERM\" in\n\
    xterm-color|*-256color) color_prompt=yes;;\n\
esac\n" \
>> ~/.bashrc
RUN echo -e "# uncomment for a colored prompt, if the terminal has the capability; turned" >> ~/.bashrc
RUN echo -e "# off by default to not distract the user: the focus in a terminal window" >> ~/.bashrc
RUN echo -e "# should be on the output of commands, not on the prompt\n" >> ~/.bashrc
RUN echo -e "force_color_prompt=yes\n" >> ~/.bashrc
RUN echo -e "# We have color support; assume it's compliant with Ecma-48" >> ~/.bashrc
RUN echo -e "# (ISO/IEC-6429). (Lack of such support is extremely rare, and such" >> ~/.bashrc
RUN echo -e "# (ISO/IEC-6429). (Lack of such support is extremely rare, and such" >> ~/.bashrc
RUN echo -e "if [ -n \"\$force_color_prompt\" ]; then\n\
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then\n\
    color_prompt=yes\n\
    else\n\
    color_prompt=\n\
    fi\n\
fi\n\
\n\
if [ \"\$color_prompt\" = yes ]; then\n\
    PS1='\${debian_chroot:+(\$debian_chroot)}\[\\033[01;32m\]\u@\h\[\\033[00m\]:\[\\033[01;36m\]\w\[\\033[00m\]\n\[\\033[01;33m\]$\[\\033[00m\] '\n\
else\n\
    PS1='\${debian_chroot:+(\$debian_chroot)}\u@\h:\w\\\$ '\n\
fi\n\
unset color_prompt force_color_prompt\n" \
>> ~/.bashrc
RUN echo -e "# If this is an xterm set the title to user@host:dir\n\
case \"\$TERM\" in\n\
xterm*|rxvt*)\n\
    PS1=\"\[\\e]0;\${debian_chroot:+(\$debian_chroot)}\u@\h: \w\\a\]\$PS1\"\n\
    ;;\n\
*)\n\
    ;;\n\
esac\n" \
>> ~/.bashrc
# alias
RUN echo -e "alias ls=\"ls --color=auto\"\n\
alias ll=\"ls -alF --color=auto\"\n\
alias vi=\"vim\"" \
>> ~/.bashrc
# .vimrc
RUN echo -e "set nu\n\
set ai\n\
set si\n\
set cindent\n\
set sts=4\n\
set ts=4\n\
set shiftwidth=4\n\
set wmnu\n\
set laststatus=2\n\
set ignorecase\n\
set hlsearch\n\
set nocompatible\n\
set ruler\n\
set fileencodings=utf-8,euc-kr\n\
set fencs=ucs-bom,utf-8,euc-kr\n\
set showmatch\n\
syntax on\n\
filetype indent on\n\
set bs=indent,eol,start\n\
set title\n\
color evening\n" \
> ~/.vimrc
RUN source ~/.bashrc
CMD ["bash"]
```
### 짜잔 ~ 이렇게 꾸밀 수 있다.
#### ![image](https://user-images.githubusercontent.com/62974484/206049136-d95ceb04-102f-4136-bf44-0015a74ef9c4.png)
### <br/><br/><br/> 

