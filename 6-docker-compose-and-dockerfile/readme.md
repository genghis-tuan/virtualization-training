# Create Many Containers With Docker Compose

## This will create several containers to simulate an actual workload

NOTE: THIS IS A CONTRIVED EXAMPLE JUST TO HELP DEMONSTRATE A WORKLOAD

- Two web servers for web content.
- A backend server to do some processing.
- A db server to persist data.
- A redis server for message queue.

*The servers have nothing to do with each other in-terms of code and interaction.
We just want to see the benefit of Docker Compose.*

## This example will

- handle the image build
- handle overriding ARG and ENV (some environment variables from a file)
- create the containers
- publish the ports we want
- mount the volume we want
- stops and destroys the containers

## Running it

- change directory into the directory of this readme
- run `docker compose up -d`
- visit one website at [localhost:8888](http://localhost:8888)
  - this site serves static content that is built into the image
- visit one website at [localhost:9999](http://localhost:9999)
  - this site mounts a volume to a folder on the this machine.
  - change something in the `web_development` folder in this directory and
    refresh the page to see the change

## List All The Containers That Are Running

`docker ps -a`

## Clean-up

`docker compose down`

That was much easier than creating containers using a script and cleaning
them up afterwards.
