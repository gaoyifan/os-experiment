#!/bin/bash

git config user.name $GIT_USER_NAME
git config user.email $GIT_USER_EMAIL
ghp-import -n book
git push -qf https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages
