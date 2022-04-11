#!/bin/sh -l

# Setup SSH
mkdir -p /root/.ssh
echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

if [ -n "${INPUT_TARGET_BRANCH+set}" ];
then
   git remote add destination "$INPUT_TARGET_REPO_URL"
   git push destination "$INPUT_TARGET_BRANCH" -f
   echo "Synced with $INPUT_TARGET_BRANCH"
else
   echo "You need to set a target_branch"
fi
