FROM r-base

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

USER root

# install packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    libzmq3-dev \
    vim \
    wget

# get jupyter
RUN apt-get install -y \
    python3 \
    python3-pip
RUN pip3 install jupyter

# setup R
RUN apt-get install -y wget && \
    wget https://raw.githubusercontent.com/kkchau/MED263/master/r_install.sh && \
    bash r_install.sh

# download the jupyter notebook
wget https://raw.githubusercontent.com/kkchau/MED263/master/CoExNetworks.ipynb

RUN mkdir /work

ENV HOME=/work

EXPOSE 8888

WORKDIR /work

ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--allow-root"]
