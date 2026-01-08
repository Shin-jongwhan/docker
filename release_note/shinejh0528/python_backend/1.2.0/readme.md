### 251022
# 1.2.0
### add tini (for kubernetes)
### You can use tini on kubernetes yaml like
```
  containers:
    - name: backend
      image: shinejh0528/python_backend:1.2.0
      imagePullPolicy: Always
      command: ["/usr/bin/tini", "--", "/bin/bash", "-c"]
      args:
        - |
          set -e
          cp /data/cert/ssl/_wildcard_theragenbio_com.crt /usr/local/share/ca-certificates/ && \
          update-ca-certificates && \
          service sendmail start && \
          service cron start && \
          chmod +x /data/theragenome_workflow_backend/jhshin/dev/cron_manager.sh && \
          mkdir -p /data/tgf/data/log/backend && \
          LINE='* * * * * /bin/bash /data/theragenome_workflow_backend/jhshin/dev/cron_manager.sh 1>> /data/tgf/data/log/backend/log.txt 2>&1' && \
          ( crontab -l 2>/dev/null | grep -Fv -- "$LINE"; echo "$LINE" ) | crontab - && \
          exec sleep infinity
```
