# The base image that your image will be built upon
FROM ubuntu:20.04

# Install some packages
RUN apt-get update && apt-get install -y nano

# Define some arguments
ARG UID=7007
ARG USERNAME=jamesbond
ARG USERHOME=/home/$USERNAME
ARG STARTDIR="START-HERE"

# Define some environment variables
ENV ICECREAM_FLAVOR=vanilla
ENV LIKES_PIZZA=true

# Create a user and create the user's home directory
RUN useradd -m $USERNAME -u $UID

USER $USERNAME:$USERNAME

# Set the starting directory. This is directory where you enter the container.
WORKDIR $STARTDIR

# The command that is run upon entering the container.
CMD [ "/bin/bash", \
     "-c", \
     "env; \
     echo 'My UID:' $UID; \
     echo 'I am:' $(whoami); \
     printf \"\nHello Money Penny\n\n\" \
     "]