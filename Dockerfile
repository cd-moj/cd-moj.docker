FROM bitnami/minideb:bullseye

WORKDIR /cdmoj

RUN apt-get -y update && \
    apt-get -y install git &&\
    apt-get -y install apache2 &&\
    apt-get -y install vim &&\
    apt-get -y install rsync &&\
    apt-get -y install xclip &&\
    apt-get -y install curl &&\
    apt-get -y install gcc &&\
    apt-get -y install g++ &&\
    apt-get -y install wget &&\
    apt-get -y install default-jre default-jdk &&\
    apt-get -y install openjdk-17-jre openjdk-17-jdk 

RUN apt clean

COPY ./scripts/install.sh .
COPY ./config ./config/
COPY ./examples ./examples/

RUN bash ./install.sh
RUN a2enmod cgid