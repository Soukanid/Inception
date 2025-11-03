FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install nginx -y && apt-get install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj '/C=MA/ST=Rabat-Sale-Kenitra/L=Rabat/O=42/CN=localhost'

COPY ./conf/default /etc/nginx/sites-available/
COPY ./conf/default /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]

