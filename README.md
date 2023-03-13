# Minimal PHP 7.4.33 + Apache2 on Alpine Linux

This is a minimal Docker image for running PHP 7.4.33 (which will be compiled from source when building) with Apache2 on Alpine Linux.

## Why Alpine Linux?

Alpine Linux is a lightweight Linux distribution designed for security, simplicity, and resource efficiency. It uses a musl libc and busybox to provide a small and fast base system. This makes it an ideal choice for running Docker containers, especially those that need to be lightweight and secure.

## Why PHP 7.4.33 and Apache2?

PHP 7.4.33 is the latest version of PHP 7.4 and provides numerous performance improvements and bug fixes over previous versions. Apache2 is a popular web server that is widely used in production environments. Together, PHP 7.4.33 and Apache2 provide a powerful web development stack that is widely supported and easy to use.

## Supporting Legacy PHP Versions

It's important to support legacy PHP versions without relying on PPAs. Many legacy applications rely on specific versions of PHP that may not be available in the latest Ubuntu PPAs. By using a lightweight Linux distribution like Alpine Linux and building a minimal Docker image, you can easily support legacy PHP versions without relying on PPAs.

## What's included in this Docker image?

This Docker image includes the following components:

- Alpine Linux 3.17.2
- Apache2 2.4.48
- PHP 7.4.33 with the following extensions enabled:
  - `apxs2`
  - `intl`
  - `curl`

## How to use this Docker image

To use this Docker image, you can either build it yourself using the included `Dockerfile`, or you can pull the pre-built image from Docker Hub:

To run a PHP application with this Docker image, you should mount the application code as a volume and expose port 80:

docker run --name my-php-app -p 8080:80 -v /path/to/my/php/app:/var/www/localhost/htdocs madebycm/minimal-php-apache:latest

You can then access your PHP application by visiting http://localhost:8080 in your web browser.
Conclusion

This Docker image provides a minimal and efficient setup for running PHP 7.4.33 applications with Apache2 on Alpine Linux. It's lightweight, secure, and easy to use, making it an ideal choice for web development projects of all sizes. By supporting legacy PHP versions without relying on PPAs, you can ensure that your applications continue to function as expected, even as PHP evolves over time.
