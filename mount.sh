#!/bin/bash

# Replace these values with your SMB share details
SMB_SERVER="shares.gastrowaerchstatt.local"
SMB_SHARE="data"
SMB_USERNAME="your_username"
SMB_PASSWORD="your_password"

# Create a mount point directory
MOUNT_DIR="/mnt/smb"
if [ ! -d "$MOUNT_DIR" ]; then
    sudo mkdir -p "$MOUNT_DIR"
fi

# Mount the SMB share with credentials
sudo mount -t smbfs "//${SMB_USERNAME}:${SMB_PASSWORD}@${SMB_SERVER}/${SMB_SHARE}" "$MOUNT_DIR"

# Verify if the mount was successful
if [ $? -eq 0 ]; then
    echo "SMB share mounted successfully on $MOUNT_DIR"
else
    echo "Failed to mount SMB share"
fi
