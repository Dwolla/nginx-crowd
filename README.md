# dwolla/nginx-crowd

A Docker image based on Alpine Linux with Nginx including the [Atlassian Crowd Lua Script](https://github.com/Dwolla/nginx-crowd-lua) and its dependencies.

Mount your `nginx.conf` file as a read-only volume when running the container, or build a new Docker image based on this one that copies the file into place. See the notes in the linked readme regarding how to configure Nginx to talk to Crowd.