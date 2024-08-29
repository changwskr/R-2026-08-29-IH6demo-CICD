FROM node:12 
FROM ubuntu:18.04
LABEL maintainer="roian <roian@gmail.com>"

# 환경설정 무시
ENV DEBIAN_FRONTEND=noninteractive

# install webserver apache
RUN apt-get update && apt-get install -y apache2
RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.6
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN cat /etc/apache2/apache2.conf

RUN apt-get install -y nodejs || true

EXPOSE 8181
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUD"]

RUN mkdir /home/roian
RUN mkdir /home/roian/src


#-----
#-----
#-----

# 복사원본은 항상 현재 실행위치에서 하위에 있어야 된다.
COPY $HOME/src/sp_commo.js /home/roian/src
COPY $HOME/src/sp_comrc.js /home/roian/src 
CMD ["node", "/home/roian/src/sp_commo.js"] 



