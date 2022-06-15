# The base image is the image that is used to build the Dockerfile.
FROM nginx:1.21


# ARG values are used during the build process only.
# They are not available at runtime.
ARG INITIAL_CONTENT="Some Pyscript"

# Environment variables we want to set in the container.
ENV foo="bar"

# ADD can be used to pull files from a URL
ADD https://pyscript.net/examples/repl.html /usr/share/nginx/html/index.html
ADD https://pyscript.net/examples/antigravity.py /usr/share/nginx/html/

# COPY can be used to copy files from the build directory into the image.
COPY ./web_content/* /usr/share/nginx/html/

RUN chmod +r /usr/share/nginx/html/*

# This will run the nginx process
CMD ["nginx", "-g", "daemon off;"]
