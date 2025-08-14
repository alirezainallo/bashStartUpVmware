#!/bin/bash
for i in {1..30}; do
    if vmhgfs-fuse -h > /dev/null 2>&1; then
        break
    fi
    echo "Waiting for vmhgfs-fuse to be ready..."
    sleep 2
done

sudo mkdir -p /mnt/hgfs
sudo mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
touch onStartUpCreated.txt

echo "Mount command executed at $(date)" >> /tmp/mount.log
echo "StartUp Task Worked"
