### 250716
# Update
### new pip package : gunicorn
### Changed SMTP service startup method to use entrypoint
### Updated container execution process:
#### Now starts with:
```bash
docker run -itd shinejh0528/django:1.3.1
```
#### Then connect using:
```bash
docker exec -it <container_id> /bin/bash
```
