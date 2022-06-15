#!/usr/bin/env bash

# shellcheck disable=SC2128
SCRIPT_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

# create a container that exposes its port 80 to the host's port 8080
# mount the host's web_development to the container's /usr/share/nginx/html directory
# name the container "nginx-development"
# run the container in detached mode (in the background)

# notice that I use 'nerdctl' instead of 'docker' because on my machine,
# I have a 'nerdctl' alias that points to 'docker'.
# Docker Desktop is not installed, Rancher Desktop is and it comes with nerdctl.

echo $SCRIPT_DIR
nerdctl run --detach --publish 8080:80 \
--volume $SCRIPT_DIR/web_development/:/usr/share/nginx/html/ \
--name nginx_development nginx:1.21


# But now we'll still need a script of some sort to stop the container and destroy it.