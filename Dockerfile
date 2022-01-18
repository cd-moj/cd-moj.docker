FROM debian:bullseye

WORKDIR /cdmoj-dev

RUN apt-get -y update && \
    apt-get -y install git &&\
    apt-get -y install apache2 &&\
    apt-get -y install vim &&\
    apt-get -y install rsync &&\
    apt-get -y install xclip &&\
    apt-get -y install curl

COPY ./scripts/install.sh .
COPY ./scripts/directory.sh ./scripts/
COPY ./config ./config/
COPY ./examples ./examples/

EXPOSE 80

RUN bash ./install.sh

RUN a2enmod cgid
 