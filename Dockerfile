FROM debian:bullseye

WORKDIR /cdmoj-dev

RUN apt-get -y update && \
    apt-get -y install git &&\
    apt-get -y install apache2 &&\
    apt-get -y install vim &&\
    apt-get -y install rsync &&\
    apt-get -y install xclip &&\
    apt-get -y install curl &&\
    apt-get -y install gcc &&\
    apt-get -y install g++


COPY ./scripts/install.sh .
COPY ./config ./config/
COPY ./examples ./examples/
COPY ./problems ./problems/

EXPOSE 80

RUN bash ./install.sh

RUN a2enmod cgid
 