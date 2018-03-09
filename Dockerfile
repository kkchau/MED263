FROM rocker/verse

MAINTAINER Kevin Chau "kkchau@ucsd.edu"

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    libcurl4-openssl-dev \
    libssl-dev \
    libv8-3.14-dev \
    libzmq3-dev

RUN R -e "install.packages(c('matrixStats', 'Hmisc', 'splines', \
                             'foreach', 'doParallel', 'fastcluster', \
                             'dynamicTreeCut', 'survival', 'viridisLite', \
                             'enrichR', 'tidyverse'), \
                             repos='https://cran.cnr.berkeley.edu')"

RUN R -e "source('https://bioconductor.org/biocLite.R'); \
          biocLite(c('GO.db', 'preprocessCore', 'imput', \
                     'WGCNA', 'SummarizedExperiment'))"

RUN mkdir /home/rstudio/work
ADD data /home/rstudio/data
ADD docs/CoExNetworks.Rmd /home/rstudio/CoExNetworks.Rmd

WORKDIR /home/rstudio/work

