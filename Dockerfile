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

# Set the default command to execute
# when creating a new container
# By default start up apache in the foreground, override with /bin/bash for interative.
CMD /usr/sbin/apache2ctl -D FOREGROUND