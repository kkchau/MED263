# get the Jupyter notebook
wget -O /home/jovyan/work/CoExNetworks.ipynb https://raw.githubusercontent.com/kkchau/MED263/master/CoExNetworks.ipynb

# setup system packages
sudo apt-get update && apt-get install -y \
apt-transport-https \
libcurl4-openssl-dev \
libssl-dev \
libv8-3.14-dev \
libzmq3-dev

# relevant r packages
cat > /home/jovyan/r_deps.R << EOM
install.packages(c("matrixStats", "Hmisc", "splines", "foreach", "doParallel", "fastcluster", "dynamicTreeCut", "survival", "viridisLite"), repos="https://cran.cnr.berkeley.edu")
source("https://bioconductor.org/biocLite.R")
biocLite(c("GO.db", "preprocessCore", "impute"))
biocLite("WGCNA")
biocLite("SummarizedExperiment")
EOM
Rscript /home/jovyan/r_deps.R
