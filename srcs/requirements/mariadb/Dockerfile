FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./tools/script.sh /
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /script.sh

CMD ["/script.sh"]
