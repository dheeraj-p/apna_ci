#! /bin/bash

repository_url=$1
CI_REPOS_DIR=".ci_repositories"

#Create ".ci_repositories" directory if it does not already exists
if [ ! -d "$CI_REPOS_DIR" ]; then
  mkdir "$CI_REPOS_DIR";
fi
cd "$CI_REPOS_DIR"
