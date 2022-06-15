<!-- markdownlint-disable -->
# Create an Nginx Web Server To Test Your Web Code

This example uses `docker-compose` to handle container starting, stopping, and destroying

## Change directory into this directory

## Then run the following to run docker compose

`docker compose up` This will run in the foreground and display logs in the terminal.

## Open a browser to localhost port 8080

[Your machine port 8080](http://localhost:8080)

## Change some code and view it

- modify or add something `../content/web_development`
- refresh the web page

- `ctrl c` to stop `docker-compose`
- `docker ps -a` to list the containers and notice that `docker-compose` cleaned-up for us.

## Now run the following to run docker compose `detached`

`docker compose up -d`

## Open a browser to localhost port 8080

[Your machine port 8080](http://localhost:8080)

## Change some code and view it

- modify or add something `../content/web_development`
- refresh the web page

## View your list of containers

`docker ps -a | grep nginx-development`

## Destroy the container and clean-up

`docker compose down`
`docker ps -a` ...nothing to clean-up
