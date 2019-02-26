# docker build --build-arg WORDPRESS_VERSION=5.1 --build-arg PHP_VERSION=7.3 -t "wordhat/wordhat:wp-5.1-php-7.3" .
# docker push wordhat/wordhat:wp-5.1-php-7.3
ARG WORDPRESS_VERSION
ARG PHP_VERSION

FROM wordpress:${WORDPRESS_VERSION}-php${PHP_VERSION}
LABEL Maintainer="Paul Gibbs" \
  Description="WordPress container with WP-CLI and mysqldump"

RUN curl -o /usr/local/bin/wp -SL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp

# WordHat requires mysqldump.
RUN apt-get update
RUN apt-get install -y --no-install-recommends mysql-client
