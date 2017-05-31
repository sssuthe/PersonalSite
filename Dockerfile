############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM debian:jessie

# File Author / Maintainer
MAINTAINER Sean Sutherland <sssuthe@gmail.com>

# Update the repository
RUN apt-get update

# Install Apache
RUN apt-get -y install apache2


# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Copy this repo into place.
ADD css /var/www/site/css
ADD img /var/www/site/img
ADD about.html /var/www/site
ADD contact.html /var/www/site
ADD index.html /var/www/site
ADD main.css /var/www/site

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD /usr/sbin/apache2ctl -D FOREGROUND