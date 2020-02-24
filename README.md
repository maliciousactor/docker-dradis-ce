# Docker Image for Dradis CE

[![GitHub](http://img.shields.io/badge/github-maliciousactor/docker--dradis--ce-blue.svg?style=plastic)](https://github.com/maliciousactor/docker-dradis-ce/)
[![Build Status](https://img.shields.io/travis/com/maliciousactor/docker-dradis-ce?style=plastic)](https://travis-ci.com/maliciousactor/docker-dradis-ce) [![Docker Pulls](https://img.shields.io/docker/pulls/maliciousactor/dradis-ce?style=plastic)](https://hub.docker.com/r/maliciousactor/dradis-ce)

A [Docker](https://www.docker.com/) image for [Dradis CE](https://dradisframework.com/).

### Supported Tags and Respective `Dockerfile` Links

* `latest` ([*/Dockerfile*](https://github.com/maliciousactor/docker-dradis-ce/blob/master/debian/Dockerfile))
* `debian` ([*/Dockerfile*](https://github.com/maliciousactor/docker-dradis-ce/blob/master/debian/Dockerfile))
* `kali` ([*/Dockerfile*](https://github.com/maliciousactor/docker-dradis-ce/blob/master/kali/Dockerfile))

---

#### What is Dradis CE?

[Dradis CE](https://dradisframework.com/) is an open-source collaboration framework, tailored to InfoSec teams.

---

#### How to Use This Image

##### Pull Docker Image

    $ docker pull maliciousactor/dradis-ce

##### Create Database Directory

    $ mkdir -p ~/docker/dradis-ce/data

##### Run Dradis CE

    $ docker run \
        --name dradis-ce
        --publish 3000:3000 \
        --volume "~/docker/dradis-ce/data:/data" \
      maliciousactor/dradis-ce

##### Use Dradis CE

Dradis CE is accessible at [http://127.0.0.1:3000/](http://127.0.0.1:3000/).

---

#### Running in Production

This container is not leveraging SSL.

As such, it is strongly recommended to place this behind a proxy, such as nginx, for production use.

#### Exposed Ports

* `3000`: Dradis CE Web Application HTTP Port

---

#### Build from Source

Build the Docker image from source instead of pulling it from Docker Hub:

    $ git clone https://github.com/maliciousactor/docker-dradis-ce docker-dradis-ce
    $ cd docker-dradis-ce
    $ docker build -t maliciousactor/dradis-ce .

