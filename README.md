# Drocker

> Dockerized Drupal development stack: Nginx, MySQL, PHP-FPM, Drush

Drudocker gives you everything you need for developing PHP applications locally. 
The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](https://github.com/jyr/MNPP) stack as regular NAMP stacks quite simply can't keep up with the Nginx + PHP-FPM combo in terms of performance. 
I hope you'll find it as useful!

## What's inside

* [Drupal](http://drupal.org/)
* [Nginx](http://nginx.org/)
* [PHP-FPM](http://php-fpm.org/)
* [MySQL](http://www.mysql.com/)

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)

## Running

Set up a Docker Compose and then run:

```sh
$ docker-compose up
```

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## License

Copyright &copy; 2015 [Rostislav Levkovic](http://github.com/rostislavl). Licensed under the terms of the [MIT license](LICENSE.md).

## Credits

[Kasper Kronborg Isager](http://github.com/kasperisager)