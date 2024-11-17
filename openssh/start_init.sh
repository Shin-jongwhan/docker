cp /usr/local/bin/sshd_config /etc/ssh/sshd_config
service ssh start

echo "root:${root_pw}" | chpasswd

while true; do
  sleep 3600;
done