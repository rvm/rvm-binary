#!/bin/bash

# Set a shared artifacts directory between swarm nodes
# Alternatively, set a directory that will be written independently on each node
# Whether shared or not, it must exist before running builds
#export ARTIFACTS_DIR=/shared/rvm-artifacts

# When running on a multi-node cluster, builds should be pushed to a docker registry
# If this variable is in the form of a host[:port] it should point to a valid registry
# If the registry requires login, you should login on each node using docker login
# If you have a free account on Docker Hub, you can simply push the images there
# but they will be public. In such case, just put your username
# Note that in all cases the trailing slash is required
#export REPOSITORY_URL=PUT_IP_HERE:8000/

# Set this to a remote docker engine IP
# If not set, will run on the local docker engine
#export DOCKER_HOST=PUT_IP_HERE:2375
