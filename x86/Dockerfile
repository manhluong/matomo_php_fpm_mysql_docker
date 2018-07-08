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

WORKDIR /

ARG matomo_version=3.5.1

RUN curl -O "https://builds.piwik.org/matomo-${matomo_version}.zip" && \
 unzip "matomo-3.5.1.zip"

RUN rm *.html && \
 rm *.zip

RUN chown -R www-data:www-data /matomo && \
 chmod -R 0777 /matomo

RUN curl -O "https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz" && \
 tar xvzf "GeoLite2-City.tar.gz" && \
 mv "GeoLite2-City_20180703/GeoLite2-City.mmdb" "/matomo/misc" && \
 rm "GeoLite2-City.tar.gz" && \
 rm -rf "GeoLite2-City_20180703/"

