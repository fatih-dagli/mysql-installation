#!/bin/bash

ENCRYPTED_PASSWORD="ZWxhc3RlMTIzCg=="

# Decrpyt the password
DECRYPTED_PASSWORD=$(echo $ENCRYPTED_PASSWORD | base64 -d)

# Copy the keys to related servers
sshpass -p "$DECRYPTED_PASSWORD" ssh-copy-id root@10.0.1.10
sshpass -p "$DECRYPTED_PASSWORD" ssh-copy-id root@10.0.2.20