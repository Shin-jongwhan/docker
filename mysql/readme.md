### 231011
## port 변경하여 실행하는 방법
### docker 접
```
docker run -e MYSQL_ROOT_PASSWORD=root -d -p 3307:3306 mysql:8.0.34

# container id 확인
docker ps

# 접속
docker exec -it 45c0169946ba /bin/bash
```
### <br/>

### my.cnf 가 어디있는지 확인한다.
```
mysql --verbose --help | grep my.cnf
```
### 이렇게 여러 경로가 출력이 되는데 앞쪽꺼부터 하나씩 확인한다.
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/46634170-f5b3-4d86-938c-a893e103d672)
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/4207f43c-491b-4cc2-b353-6bf33d5af9ef)
#### ![image](https://github.com/Shin-jongwhan/docker/assets/62974484/ed1ea27c-27fe-40fd-8a0e-af5e133c0463)
### <br/>

### 찾은 경로에 my.cnf 를 수정해주는데, port 만 입력해주면 된다.
```
port=변경할 포트
```
```
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/8.0/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M

# Remove leading # to revert to previous value for default_authentication_plugin,
# this will increase compatibility with older clients. For background, see:
# https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin
# default-authentication-plugin=mysql_native_password
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql

pid-file=/var/run/mysqld/mysqld.pid
[client]
socket=/var/run/mysqld/mysqld.sock
port=3307

!includedir /etc/mysql/conf.d/

```
