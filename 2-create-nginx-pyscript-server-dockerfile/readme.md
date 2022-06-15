# Create An Image that uses `ADD` and `COPY`

## This image build pulls in 2 external html files and also copies local files into the image that is built

This example will pull 2 files from a URL and place them into the nginx document root.
It will also copy a simple local html document into the image's nginx document root.

We'll create an image from which the containers will be python REPLs.

This is an actual web application!

- Change directory into the directory of this readme file
- Run:

```bash
docker build -t pyscript:v1 .
```

- Test:

```bash
docker images | grep pyscript
```

- The image should be present. You've successfully created a image.

- Test the image by creating a container that runs interactively (the logs show in the terminal):

```bash
docker run -it --publish 8080:80 --name pyscript pyscript:v1
```

- Test the website at [localhost:8080](http://localhost:8080)
Can we run this in the REPL: `print(f"WOO{'HOO'*3}!")`

- Test the content copied in using `COPY`, navigate to: `localhost:8080/hello.html`

- Stop and delete the container
- Press: `ctrl c` to stop the container
- `docker rm pyscript` to delete the container

- Run the container detached (the container runs in the background and logs do not show in the terminal):

```bash
docker run --detach --publish 8080:80 --name pyscript pyscript:v1
```

- Stop and delete the container
- `docker stop pyscript`
- `docker rm pyscript`
