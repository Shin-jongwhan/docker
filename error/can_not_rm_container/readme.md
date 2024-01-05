### 240105
## 권한 에러로 container 제거를 못 할 때
```
Error response from daemon: Could not kill running container 9a8da41cb64a0be582d7caf92978d09356f1f7ca6574d5a350be461a4d5c80de, cannot remove - permission denied
```
### 다음과 같이 pid 를 얻는다
```
sudo ps awx | grep containerd-shim | grep [container_id] | awk '{print $1}'
```
### 그리고 kill
```
kill -9 [pid]
```
