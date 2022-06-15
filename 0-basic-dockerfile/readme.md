# Simple Ubuntu Image Built With a Dockerfile

## GOALS

1. Create a basic Docker image
2. Create a container

### Steps

- Create the [Dockerfile](./Dockerfile)

- Change directory into the directory of this readme file
- Run:

```bash
docker build -t basic-ubuntu:v1 .
```

- Verify the build by listing the images on your machine:

```bash
docker images | grep basic-ubuntu
```

- If the image is listed, then you've successfully create a image.

- Test the image by creating a container, and immediately deleting it:

```bash
docker run --rm basic-ubuntu:v1
```

- We should see something like this...

```markdown
You built me! I am an Ubuntu 20.04.4 LTS machine.
```

- The `docker run` command was run with the `--rm` flag which tells Docker to delete it as soon as the process completes