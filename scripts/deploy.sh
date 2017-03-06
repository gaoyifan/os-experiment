#!/bin/bash
cd book
git init
git config user.name $GIT_USER_NAME
git config user.email $GIT_USER_EMAIL
git add .
git commit -m "Update Pages"
git push -qf "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
