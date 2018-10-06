FROM debian

RUN apt-get update && apt-get install && apt-get clean

RUN apt-get install curl --yes

RUN apt-get install libcurl4-openssl-dev g++ git make --yes --no-install-recommends

RUN apt-get install vim nano bash-completion --yes --no-install-recommends

RUN cd home && git clone https://github.com/AlecGoncharow/bridges-cxx-docker-project-dir.git ./bridges

RUN cd /home/bridges && mv .bashrc /root/ && mv .dir_colors /root/ && git submodule init && git submodule update 

WORKDIR /home/bridges

