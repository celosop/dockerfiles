FROM clearlinux/php-fpm

VOLUME /var/www/html

ENV WORDPRESS_VERSION 5.7.1

RUN set -ex; \
    swupd bundle-add wget -y; \
    wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz --no-check-certificate; \
    mv wordpress-${WORDPRESS_VERSION}.tar.gz wordpress.tar.gz; \
    # upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
    tar -xzf wordpress.tar.gz -C /usr/src/; \
    rm wordpress.tar.gz; \
    chown -R httpd:httpd /usr/src/wordpress

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]
