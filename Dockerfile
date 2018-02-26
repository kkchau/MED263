FROM r-base

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

USER root

# install packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
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

WORKDIR /work

RUN useradd -ms /bin/bash jovyan

USER jovyan

ENTRYPOINT ["jupyter", "notebook", "--ip=*"]
