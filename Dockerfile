############################################################
# Dockerfile with php-fpm with mysql support and matomo code
############################################################

FROM luongbui/php-7-fpm-mysql
LABEL maintainer="Luong Bui"
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y unzip && \
 apt-get autoremove -y --purge && \
 apt-get clean

ARG matomo_version=3.5.1

RUN curl -O "https://builds.piwik.org/matomo-${matomo_version}.zip" && \
 unzip 'matomo-3.5.1.zip' && \
 rm *.html && \
 rm *.zip

# External volume to share matomo code with web server.
VOLUME /matomo
