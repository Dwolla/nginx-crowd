FROM alpine:3.2
ENV NGINX_VERSION 1.9.11
RUN apk --update add ca-certificates openssl-dev pcre-dev zlib-dev curl-dev build-base && \
    mkdir -p /tmp/src && \
    cd /tmp/src && \
    curl --location -o nginx-${NGINX_VERSION}.tgz https://github.com/nginx/nginx/archive/release-${NGINX_VERSION}.tar.gz && \
    tar -zxvf nginx-${NGINX_VERSION}.tgz && \
    curl --location -o ngx_http_auth_crowd_module.tgz https://github.com/Dwolla/ngx_http_auth_crowd_module/archive/v1.0.1.tar.gz && \
    tar -zxvf ngx_http_auth_crowd_module.tgz && \
    cd /tmp/src/nginx-release-${NGINX_VERSION} && \
    auto/configure \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --add-module=/tmp/src/ngx_http_auth_crowd_module-1.0.1 \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    apk del wget build-base && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

