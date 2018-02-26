# install latest R
echo "deb https://cran.cnr.berkeley.edu/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
apt-get install r-base

# IRkernal
cd /opt
cat > r_kernel.R << EOM
install.packages(c('crayon', 'pbdZMQ', 'devtools'))
devtools::install_github(paste0('IRkernel/', c('repr', 'IRdisplay', 'IRkernel')))
IRkernel::installspec(user=FALSE)
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

cd /
