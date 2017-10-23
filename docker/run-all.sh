#!/bin/bash

set -e

source environment.sh

# read all platforms
while read platform; do
  pname=`echo $platform | cut -d: -f1`
  ptag=`echo $platform | cut -d: -f2`
  export PLATFORM=$pname
  export TAG=$ptag
  image=${REPOSITORY_URL}rvm-$pname:$ptag
  # build platform image
  echo "Building image $image"
  docker-compose build --no-cache
  if [ "$REPOSITORY_URL" != "" ]; then
    echo "Pushing image $image"
    docker push $image
  fi
  # read rubies
  while read ruby; do
    export RUBY_VERSION=$ruby
    # deploy stack to start the build process
    stackname=`echo ${pname}_${ptag}_${ruby} | tr -d '.'`
    docker stack deploy -c docker-stack.yml $stackname
  done < config/rubies
done < config/platforms

