# MED263
Final project for MED263 (Bioinformatics Applications to Human Disease): Gene Co-Expression Networks with WGCNA

This Docker image runs based on rocker/verse and provides the necessary 
packages, data files, and R Markdown file for a WGCNA-based gene co-expression 
network analysis on publicly available brain expression data.  

TODO: Add BrainSpan data, Rmd notebook

## Instructions
```shell
docker run -p 8787:8787 /your/working/directory:/home/rstudio/work kkhaichau/weighted_networks
```
Then, launch a web browser and navigate to localhost:8787  

---
Recommended Docker settings include:
* CPUs: 2
* Memory: 4096 MB

---
**References**
1.  Langfelder, P., & Horvath, S. (2008). WGCNA: an R package for weighted correlation network analysis. BMC Bioinformatics, 9, 559. http://doi.org/10.1186/1471-2105-9-559
2.  Chen, E. Y., Tan, C. M., Kou, Y., Duan, Q., Wang, Z., Meirelles, G. V., … Ma’ayan, A. (2013). Enrichr: interactive and collaborative HTML5 gene list enrichment analysis tool. BMC Bioinformatics, 14, 128. http://doi.org/10.1186/1471-2105-14-128
