# install dependent Ubuntu packages
apt-get update && apt-get install -y \
    build-essential \
    curl \
    vim \
    wget


# install R packages
cd /opt
cat > r_dependencies.R << EOM
source("https://bioconductor.org/biocLite.R")
biocLite("WGCNA")
biocLite("SummarizedExperiment")
EOM
Rscript r_dependencies.R

