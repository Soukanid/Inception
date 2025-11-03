FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php-fpm php-mysql -y
RUN apt-get install curl -y

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /

RUN  chmod +x /


CMD ["sh", "/script.sh"]
