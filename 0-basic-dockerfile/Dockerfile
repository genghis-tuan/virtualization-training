# The base image that your image will be built upon
# https://hub.docker.com/_/ubuntu
FROM ubuntu:20.04

# Install some packages and some customization
# Install nano text editor and sqlite3.
RUN apt-get update && \
apt-get install -y \
lsb-release \
nano \
sqlite3

# The command that is run upon entering the container.
# The entire process that this container will run is this command. Then it will exit.
CMD [ "/bin/bash", "-c", "echo You built me! I am an $(lsb_release -d| cut -d ':' -f2) machine."]