FROM nginx:alpine

MAINTAINER Pierre GINDRAUD <pgindraud@gmail.com>

ENV ENABLE_HTTPS=yes

# Install dependencies
RUN apk --no-cache add \
      openssl

# copy local files
COPY root/ /

VOLUME ["/etc/nginx/ssl"]

CMD ["/start.sh"]
