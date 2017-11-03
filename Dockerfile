FROM nginx:stable-alpine
MAINTAINER Sean Sutherland <sssuthe@gmail.com>

COPY src /etc/nginx/html/
COPY docker/conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN ls /etc/nginx/html

HEALTHCHECK --interval=10s \
  CMD wget -s http://localhost || exit 1

EXPOSE 80
