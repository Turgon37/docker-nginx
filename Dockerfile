FROM nginx:alpine

MAINTAINER Pierre GINDRAUD <pgindraud@gmail.com>

ENV ENABLE_HTTPS=yes \
    NGINX_USER=nginx \
    NGINX_GROUP=nginx

# Install dependencies
RUN apk --no-cache add \
      openssl

# copy local files
COPY root/ /

VOLUME ["/etc/nginx/ssl"]
WORKDIR /etc/nginx

CMD ["/start.sh"]
