# MED263
Final project for MED263 (Bioinformatics Applications to Human Disease): Gene Co-Expression Networks with WGCNA

## Instructions
```shell
docker run -it -p 8888:8888 /your/working/directory:/home/jovyan/work --user root -e NB_GID=100 -e GRANT_SUDO=yes kkhaichau/weighted_networks
```
Now, open the Jupyter server and create a new terminal. In the terminal, run
```shell
sudo sh ../setup.sh
```
This will install all packages and dependencies, as well as download the CoExNetworks Jupyter notebook. Close the terminal and open the notebook.
