FROM alpine:3.17.2

LABEL MADEBY="CM"

# https://www.php.net/distributions/php-7.4.33.tar.gz

WORKDIR /usr/madebycm/

RUN apk add --no-cache build-base autoconf bison libxml2-dev openssl-dev sqlite-dev postgresql-dev apache2 apache2-dev curl-dev wget && \
    wget https://www.php.net/distributions/php-7.4.33.tar.gz && tar -xvf php-7.4.33.tar.gz && cd php-7.4.33 && \
    ./configure --with-apxs2 --enable-intl --with-curl && \
    make && make install && \
    cd .. && rm php-7.4.33.tar.gz && rm -rf php-7.4.33

WORKDIR /etc/apache2/

# remove line starting with LoadModule php7_module
RUN sed -i '/LoadModule php7_module/d' httpd.conf && \
    echo "LoadModule php7_module        /usr/lib/apache2/libphp7.so" >> httpd.conf && \
    echo "<FilesMatch \.php$>" >> httpd.conf && \
    echo "    SetHandler application/x-httpd-php" >> httpd.conf && \
    echo "</FilesMatch>" >> httpd.conf && \
    sed -i 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/g' httpd.conf && \
    # Delete whole <Directory "/var/www/localhost/htdocs"> </Directory> block
    sed -i '/<Directory "\/var\/www\/localhost\/htdocs">/,/<\/Directory>/d' httpd.conf && \
    echo "<Directory \"/var/www/localhost/htdocs\">" >> httpd.conf && \
    echo "    Options Indexes FollowSymLinks" >> httpd.conf && \
    echo "    AllowOverride All" >> httpd.conf && \
    echo "    Require all granted" >> httpd.conf && \
    echo "</Directory>" >> httpd.conf

CMD [ "httpd", "-D", "FOREGROUND" ]