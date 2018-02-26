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

# configure environment
ENV SHELL=/bin/bash \
    NB_USER=net \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.utf-8 \
ENV HOME=/home/$NB_USER

ADD fix-permissions /usr/local/bin/fix-permissions
RUN useradd -ms /bin/bash -N -u $NB_UID $NB_USER && \
    chmod g+w /etc/passwd /etc/group && \
    fix-permissions $HOME

EXPOSE 8888

WORKDIR /home/$NB_USER/work
USER $NB_UID

ENTRYPOINT ["jupyter", "notebook", "--ip=*"]
