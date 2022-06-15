# The base image is the image that is used to build the Dockerfile.
FROM nginx:1.21


# ARG values are used during the build process only.
# They are not available at runtime.
ARG INITIAL_CONTENT="I WAS JUST BUILT"

# Environment variables we want to set in the container.

# Copy files into the image.
COPY web_content/* /usr/share/nginx/html

ADD https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css /usr/share/nginx/html/bootstrap.min.css

RUN chmod +r /usr/share/nginx/html/bootstrap.min.css

# Commands we want to run in the container to get it setup.
RUN echo "<p>$INITIAL_CONTENT</p></div></body></html>" >> /usr/share/nginx/html/index.html

# ENV values are available at runtime.
# This we will override using `environment` in the docker-compose file
ENV TOMATO_PRICE=2.45

# These we will override with a file in docker-compose
ENV APPLE_COUNT=42
ENV ADD_MARSHMALLOWS=false

CMD ["nginx", "-g", "daemon off;"]
