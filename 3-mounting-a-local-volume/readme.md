# Create A Container That Is Mounted To A Local Disk Volume

## This container will be mounted to a local disk volume so that files can be shared between the host and the container

Mounting a volume does a couple of useful things.

- It allows easily editing files on the host using the development tools we need and
  at the same time, it allows the container to serve the content we write/edit.
- It allows persistence. Containers are created and destroyed, but sometimes we want
  to retain files and information.

This example will mount the container's web root to the web_development directory in this directory.

This is an actual simple web development server!

- Change directory into the directory of this readme file
- Run:

```bash
docker build -t mynginx:v1 .
```

- Test:

```bash
docker images | grep mynginx
```

- The image should be present. You've successfully created a image.

- Run the container detached and mount the `web_development` directory to `/usr/share/nginx/html/`:
- We pass in absolute path of `web_development` to the `docker run` command and mount it to the nginx doc root.

```bash
docker run --detach --publish 8080:80 --volume $(PWD)/web_development:/usr/share/nginx/html --name my-webdev mynginx:v1
```

- Modify the file in `web_development`, then refresh the browser. The content should be updated.

- Stop and delete the container
- `docker stop my-webdev`
- `docker rm my-webdev`

Check the files in `web_development`. As expected, they remain and are retained
your changes even after the container is destroyed.
