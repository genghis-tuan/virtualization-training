# Docker

<!-- markdownlint-disable -->
## Our Docker Topics For Today

- [Docker](#docker)
  - [Our Docker Topics For Today](#our-docker-topics-for-today)
    - [Installation](#installation)
    - [Commands we'll use today](#commands-well-use-today)
    - [Dockerfile](#dockerfile)
      - [Examples](#examples)
      - [COMMON INSTRUCTIONS](#common-instructions)
    - [Docker Build Example Command](#docker-build-example-command)
    - [Docker Run Example Command](#docker-run-example-command)
    - [Docker Compose Example Command](#docker-compose-example-command)
    - [Best Practices](#best-practices)
  - [REFERENCE](#reference)

### Installation

- [Install Rancher Desktop](https://rancherdesktop.io/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)
  - `brew install docker-compose`

### Commands we'll use today

- List containers: `docker ps -a`
- Stop a container: `docker stop <containerName or containerID>`
- Delete a container: `docker rm <containerName or containerID>`
- Get an image's ID: `docker images | grep pyscript | awk -F ' ' '{print $3}'`
- Better way to get image ID: `docker images pyscript --format "{{.ID}}"`
- Remove an image by name: `docker rmi $(docker images | grep pyscript | awk -F ' ' '{print $3}')`
- Better way to remove image by name `docker rmi $(docker images pyscript --format "{{.ID}}")`
- DELETE ALL IMAGES: `docker rmi $(docker images --format "{{.ID}}")`

### Dockerfile

#### Examples

- [Basic Example](./0-basic-dockerfile/readme.md)
- [ARG, ENV, WORKDIR, and USER examples](1-create-ubuntu-server-dockerfile/readme.md)
- [ADD and COPY examples](2-create-nginx-pyscript-server-dockerfile/readme.md)
- [Mounting a volume](3-mounting-a-local-volume/readme.md)
- [Bad example script](4-create-dev-server-with-script/readme.md)
- [Docker Compose](5-create-dev-server-with-docker-compose/readme.md)
- [Bringing it all together](6-docker-compose-and-dockerfile/readme.md)

#### COMMON INSTRUCTIONS

- `FROM`must be the first instruction. Specifies the base image
- `ARG` values present at build time
  - pass arg in during build
      `docker build --build-arg STARTDIR=/here -t myubuntu:1.0 .`
- `COPY` copy files into the image during build time
- `ADD` similar to `COPY` except allows downloading files from a URL
- `RUN` command to execute during the build
- `ENV` environment variable
- `USER`containers run as `root` by default. This creates a default user.
- `WORKDIR` the working directory of the container
- `CMD` its parameters can be overridden
- `ENTRYPOINT` similar to `CMD` but parameters to the command cannot be overridden
  - [nice reference](https://www.bmc.com/blogs/docker-cmd-vs-entrypoint/)
  - `CMD` commands are ignored by Daemon when there are parameters stated within the docker run command.
    `ENTRYPOINT` instructions are not ignored but instead are appended as command line parameters
    by treating those as arguments of the command.

### Docker Build Example Command

- `docker build . --tag my-nginx:1.0`

### Docker Run Example Command

- [Docker Run Reference](https://docs.docker.com/engine/reference/run/)
- Format:
  - Program and verb: `docker run`
  - Flags:
    - `--detached` or `-d` similar as using `&` for a process in a shell
    - `--name` or `-n` allows us to give the container a name
    - `--publish` or `-p` expose a container's port(s); mapping it to host ports
    - `my-nginx:1.0` specify the image and tag (separated by a colon)
- Example: `docker run --detach --name webby --publish 7007:80 my-nginx:1.0`
- In this example we'll have a container named `webby` and we can visit it
  on the host's browser at `localhost:7007`

### Docker Compose Example Command

- `docker compose up -d`
- `while [[ true ]]; do docker images; sleep 2; clear; done`
- `docker compose down`

### Best Practices

- Create a user in the Dockerfile and do not run as root
- Do not ever store passwords in source control.
- Containers are ephemeral... they can and should be destroyed. Persist information outside of the containers.
- Don't install unnecessary packages to keep image sizes small
- Each container should only run one process
- Use as few instructions as possible.
  - example: suppose we want to install multiple packages using a package manager.

Bad example:

```bash
  RUN apt update
  RUN apt install -y lsb_release
  RUN apt install -y sqlite3
  RUN apt install -y nano
  RUN apt install -y foo
  RUN echo "some random thing"
```

Better example:

```bash
  RUN apt update && \
  apt install -y \
  foo \
  lsb_release \
  nano \
  sqlite3 &&\
  echo "some random thing"
```

Images are made up of layers. Each instruction (RUN, COPY, & ADD) add a layer to the image, which increases the size.
The better example is better because it reduces the image by 5 layers and help to reduce the image size.

- Sort multi-line arguments when possible to make review and maintenance easier.


## REFERENCE

[Kubernetes Introduction](https://drivevariant.atlassian.net/wiki/spaces/CLOUD/pages/1989869786/Kubernetes+-+Part+1)