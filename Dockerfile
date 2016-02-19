FROM alpine:3.2
RUN apk add --update nginx-lua && rm -rf /var/cache/apk/*

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

