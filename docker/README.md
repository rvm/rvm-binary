# rvm-binaries-docker

Scripts to automate ruby binary builds using docker running in swarm mode.
The swarm mode allows builds to run on multiple nodes in parallel.
With the default configuration it runs all builds on the local docker engine.
However, it is required that the docker engine be running in swarm mode.
You can easily run swarm mode by running: `docker swarm init`.
More information on docker swarm mode can be found
[here](https://docs.docker.com/engine/swarm/).

## Configuration

### Platforms (Linux only)

You can configure required platform versions you want to build for by simply
listing them in the file `config/platforms`. Each line is in the form `platform:tag`.
This matches the [Docker Hub](https://hub.docker.com/) image naming convention.
For example: `ubuntu:16.04` refers to Ubuntu version 16.04.

Currently only Ubuntu and CentOS are supported, but any Linux distribution can be
easily supported by writing a new script called `prepare-system.sh` and place it
in a new directory matching the platform name. This script installs system dependencies
for GnuPG and RVM to be installed. RVM itself will install required ruby dependencies automatically
using the `rvm autolibs packages` command. Check `ubuntu` and `centos` directories for examples.

### Rubies

Simply list required ruby version in `config/rubies` file. Note that all rubies should be
known by `rvm`. To get a list of known rubies to rvm, on any rvm installation run:
`rvm list known`. Currently, only MRI rubies are tested.

### Remote Cluster

If you have many builds, it makes sense to run them in parallel on a remote swarm cluster.
For this to happen you need to supply 3 environment variables in `config/environment.sh`
The first points to the build artifacts directory, and the second points to a docker registry
to store the docker images. Docker Hub can be used to store public images for free.
Moreover, a private registry can be easily setup on the swarm cluster itself by pulling 
the official `registry` image on the manager node:

    docker run -d -p 8000:5000 --restart always --name registry-api registry:2

This will run a registry API server which would be accessible through the manager IP
and the port 8000. Note that without any security configuration, anyone can push/pull to/from
this registry. Moreoever, you need to allow insecure registries by creating a file
at `/etc/docker/daemon.json` on each swarm node with the following contents:

    {
      "insecure-registries" : ["PUT_IP_HERE:8000"]
    }

Then restart the docker daemon.

Finally, set the `DOCKER_HOST` environment variable in the same file to point to
the cluster manager node.

## Run the builds

    ./run-all.sh

That's it.

## Upload the artifacts

TODO
