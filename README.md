# dwolla/nginx-lua

A Docker image based on Alpine Linux with the nginx-lua package installed.

Mount your `nginx.conf` file as a read-only volume when running the container, or build a new Docker image based on this one that copies the file into place.