#! /bin/bash

set -e
repository_url=$1
repository_name=$(echo "$repository_url" | cut -d"/" -f5 | cut -d"." -f1)
CI_REPOS_DIR=".ci_repositories"
INTEGRATION_INTERVAL=5

#Create ".ci_repositories" directory if it does not already exists
if [ ! -d "$CI_REPOS_DIR" ]; then
  mkdir "$CI_REPOS_DIR";
fi
cd "$CI_REPOS_DIR"

#Clone repository if it is not already cloned
if [ ! -d "$repository_name" ]; then
  git clone "$repository_url"

fi
cd "$repository_name"

set +e
#Start running test after every INTEGRATION_INTERVAL
while true; do
  clear
  mocha --reporter min
  sleep $INTEGRATION_INTERVAL
  git pull > /dev/null
done
