FROM nginx:alpine

MAINTAINER Pierre GINDRAUD <pgindraud@gmail.com>

# copy local files
COPY root/ /

VOLUME ["/etc/nginx/ssl"]

CMD ["/start.sh"]
