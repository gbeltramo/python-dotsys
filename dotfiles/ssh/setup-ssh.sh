#!/usr/bin/env bash

echo "--- SSH ---"
echo "  SSH: Generate ssh key pair with ssh-keygen"
echo "  SSH: Then, paste the .pub key in the authorized_keys of the server you need to reach"
echo "  SSH: Finally, append to ~/.ssh/config"
cat <<EOF 
Host <SERVER-NAME>
     HostName <SERVER-IP>
     Port 22
     User gabri
     IdentityFile ~/.ssh/<LOCAL-PRIVATE-KEY-FILE>
     IdentitiesOnly yes
EOF
