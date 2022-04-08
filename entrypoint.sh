#!/bin/sh -l

# Setup SSH
mkdir -p /root/.ssh
echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

git remote add destination "$INPUT_TARGET_REPO_URL"

if ${INPUT_TARGET_BRANCH+"false"}
then
   git checkout $INPUT_TARGET_BRANCH
   git push destination "$INPUT_TARGET_BRANCH:$INPUT_TARGET_BRANCH" -f
else
   git push destination "$GITHUB_REF:$GITHUB_REF" -f
fi
