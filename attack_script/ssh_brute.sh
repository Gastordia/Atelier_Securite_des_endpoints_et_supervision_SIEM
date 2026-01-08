#!/bin/bash

TARGET_HOST="ec2-35-173-203-240.compute-1.amazonaws.com"
TARGET_USER="fakeuser"
ATTEMPTS=10
DELAY=1

echo "[*] SSH brute-force simulation"
echo "[*] Target: $TARGET_USER@$TARGET_HOST"
echo "[*] Attempts: $ATTEMPTS"

for i in $(seq 1 $ATTEMPTS); do
    echo "[*] Attempt $i"

    ssh \
      -o StrictHostKeyChecking=no \
      -o UserKnownHostsFile=/dev/null \
      -o PreferredAuthentications=password \
      -o PubkeyAuthentication=no \
      -o ConnectTimeout=5 \
      ${TARGET_USER}@${TARGET_HOST} "exit" 2>/dev/null

    sleep $DELAY
done

echo "[+] Done. Check Wazuh Dashboard."
