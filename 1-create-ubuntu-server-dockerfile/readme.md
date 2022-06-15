# Using ARG, RUN, USER, and WORKDIR

## GOALS

1. Use ARG to parameterize image building
2. Use ENV to parameterize container creation
3. Use USER to create and specify non-root user
4. Use WORKDIR to specify the working directory of the container

## Steps

- Change directory into the directory of this readme file

### Building and starting containers without ENV or ARG inputs

- Run:

```bash
docker build -t myubuntu:v1 .
```

- Verify the build by listing the images on your machine:

```bash
docker images | grep myubuntu
```

- If the image is listed, then you've successfully create a image.

- Test the image by creating a container:

```bash
docker run --rm myubuntu:v1
```

- We should see something like this...

```bash
LIKES_PIZZA=true
ICECREAM_FLAVOR=vanilla
PWD=/START-HERE
HOME=/home/jamesbond
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env

Hello Money Penny
```

- **The environment variables `LIKES_PIZZA` and `ICECREAM_FLAVOR` are identical to what is in the Dockerfile**
- **The ARGs `UID`, `USERNAME`, `USERHOME`, and `STARTDIR` are identical to what is in the Dockerfile**

***

### Building with ARG inputs

**ARG inputs are used during the build process. Once an image is built, no ARG can be changed.**

- We'll override the `USERNAME` ARG so that the user is `inspectorgadget`
- We'll override the `UID` ARG so that the user ID is `4242`
- This also overrides the `USERHOME` to be `/home/inspectorgadget`

- Build the image

```bash
docker build -t myubuntu:v2 --build-arg USERNAME=inspectorgadget --build-arg UID=4242 .
```

- Create a container

```bash
docker run --rm myubuntu:v2
```

- We should see something like this...

```bash
LIKES_PIZZA=true
ICECREAM_FLAVOR=vanilla
PWD=/START-HERE
HOME=/home/inspectorgadget
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
My UID: 4242
I am: inspectorgadget

Hello Money Penny
```

***

### Creating a container with environment inputs

**ENV is used during the container creation process. They allow overriding environment variables in the image.**

- We'll override the `ICECREAM_FLAVOR` ARG so that the user is `chocolate`
- We'll override the `LIKES_PIZZA` ARG so that the user ID is `false`

- Create a container with the overrides

```bash
docker run --rm  -e ICECREAM_FLAVOR='chocolate' -e LIKES_PIZZA='false' myubuntu:v2
```

- We should see something like this...

```bash
LIKES_PIZZA=false
ICECREAM_FLAVOR=chocolate
PWD=/START-HERE
HOME=/home/inspectorgadget
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
My UID: 4242
I am: inspectorgadget

Hello Money Penny
```

- Create a container with the NEW environment variables

```bash
docker run --rm  -e IS_HUNGRY='FEED ME!' myubuntu:v2
```

- We should see something like this...

```bash
LIKES_PIZZA=true
ICECREAM_FLAVOR=vanilla
PWD=/START-HERE
HOME=/home/inspectorgadget
IS_HUNGRY=FEED ME!
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
My UID: 4242
I am: inspectorgadget

Hello Money Penny
```
