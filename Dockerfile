FROM jupyter/r-notebook

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

# R setup script
ADD setup.sh /home/jovyan/setup.sh

WORKDIR /home/jovyan/work
