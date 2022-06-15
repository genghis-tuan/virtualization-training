# Creating Containers Using Docker Commands In A Script

## Up to this point, we've been typing a lot

- For the past several examples, we've by typing `docker stop...` `docker rm ...`, etc over and over.
- There must be a better way.

## This is a suboptimal way

- We'll write a script that tries to do the work for us to save some typing.

- Change directory into the directory of this readme.
- Execute the  `not_the_best_way_script.sh` script.
  The script will create a container named `nginx_development` which serves
  a simple html page.

## This works but you will need to manually stop the container and clean it up

- Test by opening a browser to [localhost:8080](https://localhost:8080)

## Clean-up

`docker stop nginx_development && docker rm nginx_development`

## That clean-up was not terrible because it was a single container

But, what if it had involved several or even, many containers?
Surely, there is a better way...
