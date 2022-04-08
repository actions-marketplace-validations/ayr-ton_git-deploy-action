#!/bin/sh -l

# Setup SSH
mkdir -p /root/.ssh
echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

if ${INPUT_TARGET_BRANCH+"false"}
then
   git checkout $INPUT_TARGET_BRANCH
fi

git remote add destination "$INPUT_TARGET_REPO_URL"
git push destination "$GITHUB_REF:$GITHUB_REF" -f
