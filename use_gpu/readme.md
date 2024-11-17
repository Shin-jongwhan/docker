### 241118
## container에서 gpu 사용하는 방법
### 먼저 host에 nvidia 관련한 드라이버가 버전에 맞게 설치가 되어 있어야 한다.
### 이 부분은 귀찮으니.. 생략한다.
### <br/>

### 다음과 같이 --gpus all 옵션을 주고 실행한다.
```
docker run -itd --gpus all -v C:\Users\shine\Desktop\test\:/data -p 2022:22 --name test shinejh0528/private:bwa-mem3_1.0.0
```
### <br/>

### container 내부에 들어와서 nvidia-smi 명령어로 gpu 인식이 되는지 확인한다.
#### ![image](https://github.com/user-attachments/assets/125a0464-0ab7-4a83-b17e-7ddcb91d23d6)
