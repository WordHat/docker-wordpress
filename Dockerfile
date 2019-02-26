# docker build . --build-arg WORDPRESS_VERSION=5.0.3 --build-arg PHP_VERSION=7.3
ARG WORDPRESS_VERSION
ARG PHP_VERSION

FROM wordpress:${WORDPRESS_VERSION}-php${PHP_VERSION}
LABEL Maintainer="Komunitas WordPress Indonesia" \
  Description="WordPress container with PHP-FPM 7.2 on Alpine Linux."

# WordHat requires mysqldump.
RUN apt-get update
RUN apt-get install -y --no-install-recommends mysql-client
