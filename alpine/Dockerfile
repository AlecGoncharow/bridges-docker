FROM alpine

RUN apk add curl

RUN apk add g++ git make

RUN apk add vim nano bash-completion man grep

RUN cd home && git clone https://github.com/AlecGoncharow/bridges-cxx-docker-project-dir.git ./bridges

RUN cd /home/bridges && mv .bashrc /root/ && mv .dir_colors /root/ && git submodule init && git submodule update 

WORKDIR /home/bridges

