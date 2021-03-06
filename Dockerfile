#baset on diouxx/apache-proxy
FROM debian:latest

MAINTAINER alapierre "al@soft-project.pl"

#Don't ask questions during install
ENV DEBIAN_FRONTEND noninteractive

#Install apache2 and enable proxy mode
RUN apt update \
&& apt -y install \
apache2 \
nano

RUN a2enmod proxy \
&& a2enmod proxy_http \
&& a2enmod ssl \
&& a2enmod rewrite \
&& a2enmod headers \
&& service apache2 stop

#Ports
EXPOSE 80 443

#Volumes
VOLUME /opt/proxy-conf

#Launch Apache2 on FOREGROUND
COPY apache-proxy-start.sh /opt/
RUN chmod +x /opt/apache-proxy-start.sh
ENTRYPOINT ["/opt/apache-proxy-start.sh"]