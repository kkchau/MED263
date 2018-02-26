# install latest R
echo "deb https://cran.cnr.berkeley.edu/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
apt-get install r-base

# IRkernal
cd /opt
cat > r_kernel.R << EOM
install.packages(c("repr", "IRdisplay", "evaluate", "crayon", "pbdZMQ", "devtools", "uuid", "digest"))
devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(name='ir34')
EOM
Rscript r_kernel.R

# relevant r packages
cat > r_deps.R << EOM
install.packages(c("matrixStats", "Hmisc", "splines", "foreach", "doParallel", "fastcluster", "dynamicTreeCut", "survival"))
source("https://bioconductor.org/biocLite.R")
biocLite(c("GO.db", "preprocessCore", "impute"))
biocLite("WGCNA")
biocLite("SummarizedExperiment")
EOM
Rscript r_deps.R
