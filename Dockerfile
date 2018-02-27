FROM jupyter/r-notebook

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

USER root

# install packages
RUN sudo apt-get update && apt-get install -y \
    sudo apt-transport-https \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    libv8-3.14-dev \
    libzmq3-dev \
    vim \
    wget

# setup R
RUN wget https://raw.githubusercontent.com/kkchau/MED263/master/r_install.sh && \
    bash r_install.sh

# download the jupyter notebook
RUN wget https://raw.githubusercontent.com/kkchau/MED263/master/CoExNetworks.ipynb

USER jovyan

WORKDIR /home/jovyan/work
