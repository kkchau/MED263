# install latest R
#echo "deb https://cran.cnr.berkeley.edu/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
#apt-get update -y && apt-get install -y r-base

# relevant r packages
cat > r_deps.R << EOM
install.packages(c("matrixStats", "Hmisc", "splines", "foreach", "doParallel", "fastcluster", "dynamicTreeCut", "survival"), repos="https://cran.cnr.berkeley.edu")
install.packages(c("doParallel"))
source("https://bioconductor.org/biocLite.R")
biocLite(c("GO.db", "preprocessCore", "impute"))
biocLite("WGCNA")
biocLite("SummarizedExperiment")
EOM
Rscript r_deps.R
