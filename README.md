# dwolla/nginx-crowd

A Docker image based on Alpine Linux with nginx built with the [Atlassian Crowd auth module](https://github.com/kare/ngx_http_auth_crowd_module).

Mount your `nginx.conf` file as a read-only volume when running the container, or build a new Docker image based on this one that copies the file into place.