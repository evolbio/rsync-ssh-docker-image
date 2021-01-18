Rsync + SSH Docker Image
========================

Modified from instrumentisto/rsync-ssh for personal use. Adds setting up UID and GID for particular user. 


## How to use this image

Just prepend `rsync`/`ssh` command with `docker run battyjo/rsync-ssh`:
```bash
docker run --rm -i battyjo/rsync-ssh rsync --help
```

Transferring data from volume to local folder:
```bash
docker run --rm -i -v <volume-name>:/volume -v $(pwd):/mnt battyjo/rsync-ssh \
    rsync -avz /volume/ /mnt/
```

Transferring file from remote host with `rsync` to local host without `rsync`:
```bash 
docker run --rm -i -v <local-dest-path>:/mnt battyjo/rsync-ssh \
    rsync -avz <remote host>:<remote soruce path> /mnt/
```

Transferring file from remote host without `rsync` to local host with `rsync`:
```bash
rsync -avz --rsync-path="docker run --rm -i -v <remote-src-path>:/mnt battyjo/rsync-ssh rsync" \
    <remote host>:/mnt/ <local-dest-path>
```

Transfer file from remote host without `rsync` to local host without `rsync`:
```bash
docker run --rm -i -v <local-dest-path>:/mnt battyjo/rsync-ssh \
    rsync -avz --rsync-path="docker run --rm -i -v <remote-src-path>:/mnt battyjo/rsync-ssh rsync" \
        <remote-host>:/mnt/ /mnt/
```

