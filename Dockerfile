# TODO: Add BrainSpan data, Rmd notebook
FROM rocker/verse

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    libcurl4-openssl-dev \
    libssl-dev \
    libv8-3.14-dev\
    libzmq3-dev

RUN R -e "install.packages(c('matrixStats', 'Hmisc', 'splines', \
                             'foreach', 'doParallel', 'fastcluster', \
                             'dynamicTreeCut', 'survival', 'viridisLite', \
                             'ggplot2'), \
                             repos='https://cran.cnr.berkeley.edu')"

RUN R -e "source('https://bioconductor.org/biocLite.R'); \
          biocLite(c('GO.db', 'preprocessCore', 'imput', 'WGCNA', 'SummarizedExperiment'))"

WORKDIR /home/rstudio/work

