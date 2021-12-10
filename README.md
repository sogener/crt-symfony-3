# crt-symfony-3
___

### Как использовать?

1. cp .env.test .env

### Docker

`docker-compose up -d`

### Docker-hub 

`docker pull sogener/crt-symfony-3_app_1 && docker pull sogener/crt-symfony-3_webapp_1 && docker pull sogener/crt-symfony-3_database_1`

бд: https://hub.docker.com/repository/docker/sogener/crt-symfony-3_database_1 <br>
nginx: https://hub.docker.com/repository/docker/sogener/crt-symfony-3_webapp_1 <br>
php: https://hub.docker.com/repository/docker/sogener/crt-symfony-3_app_1 <br>


### Доступ в админку 

login: admin <br>
password: admin

### С чём возникли трудности?
1. Не получилось вывести фотографию из директории `/public/uploads/images/article` <br>
Я мог только выводить название текущего изображения.
