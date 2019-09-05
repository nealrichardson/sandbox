#! /bin/bash

AUTHOR_EMAIL=$(git log -1 --pretty=format:%ae)
AUTHOR_NAME=$(git log -1 --pretty=format:%an)
git config --global user.email "${AUTHOR_EMAIL}"
git config --global user.name "${AUTHOR_NAME}"
git clone -b ${TRAVIS_BRANCH} https://${GITHUB_PAT}@github.com/$TRAVIS_REPO_SLUG.git testdir
cd testdir
hub pull-request -m "testing PR"
