# borgbackup_webdav_docker

A docker container which can make a backup of a local folder to a webdav share.
It uses borgbackup and borgmatic for making the backup. 

It uses the following retention policy:
- keep_daily: 7
- keep_weekly: 4
- keep_monthly: 6
- keep_yearly: 1

### Command to start the container:
```
docker run \
--log-opt max-size=10m \
-e WEBDRIVE_USER={user>} \
-e WEBDRIVE_PASSWORD={password} \
-e WEBDRIVE_URL={url} \
-e SYNC_USERID=1001 \
-e BORG_PASSPHRASE={encryption_key} \
-e REPO_NAME={borg repo name} \
-v {local directory to backup}:/mnt/source \
--privileged \
kuhlivisj/borgbackup:latest
```

### Explanation of the different parameters:
| Paremeter | Description   |
| ---       | ---           |
| {user}    | webdav username           |
| {password}    | webdav password           |
| {url}    | webdav url           |
| {encryption_key}    | Encryptionkey used for borg repo           |
| {borg repo name}    | Name of the borg repo           |
| {local directory to backup}    | Local directory of which you want to make a backup           |
