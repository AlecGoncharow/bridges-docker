FROM debian

RUN apt-get update && apt-get install && apt-get clean

# Dependencies Start
RUN apt-get install curl --yes

RUN apt-get install --yes --no-install-recommends \ 
	libcurl4-openssl-dev \
	g++ \
	git \
	make
# Dependencies End

# Optional Packages
RUN apt-get install --yes --no-install-recommends \
	vim \
	nano \
	bash-completion 

# Configuring environment
RUN git clone https://github.com/AlecGoncharow/bridges-cxx-docker-project-dir.git ./bridges

# Moves some QoL configs to /root/ and pulls include files
RUN cd /bridges && mv .bashrc /root/ && mv .dir_colors /root/ && git submodule init && git submodule update 

WORKDIR /bridges

