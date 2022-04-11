#!/bin/sh -l

# Setup SSH
mkdir -p /root/.ssh
echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

git remote add destination "$INPUT_TARGET_REPO_URL"

if [ -n "${INPUT_TARGET_BRANCH+set}" ];
then
   git checkout $INPUT_TARGET_BRANCH
   git push destination "$INPUT_TARGET_BRANCH" -f
   echo "Pushed to branch $INPUT_TARGET_BRANCH"
else
   git push destination "$GITHUB_REF" -f
   echo "Pushed to branch $GITHUB_REF"
fi
