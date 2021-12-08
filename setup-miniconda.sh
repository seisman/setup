#!/usr/bin/env bash
#
# Install miniconda and Python packages
#
# Reference: https://docs.anaconda.com/anaconda/install/silent-mode/
#
# location to install miniconda
installdir=${HOME}/opt/miniconda
# mirror to download miniconda
# MIRROR=https://repo.anaconda.com/miniconda/  # official mirror
MIRROR=https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/  # mirror in China
# the shell name: zsh, bash or csh
shell=$(basename ${SHELL})

# the miniconda installer
if [[ $(uname) == "Linux" ]]; then
	installer=Miniconda3-latest-Linux-x86_64.sh
elif [[ $(uname) == "Darwin" ]]; then
	installer=Miniconda3-latest-MacOSX-x86_64.sh
fi

# Download miniconda installer
wget -c ${MIRROR}/${installer} -O ${installer}

# Install miniconda
bash ${installer} -b -p ${installdir}

# Activate conda in current shell
eval "$(${installdir}/bin/conda shell.${shell} hook)"

# Initialize conda (run this if this is the first time you install miniconda)
conda init ${shell}

# configure conda, changing the ~/.condarc file
conda config --add channels conda-forge     # Add the conda-forge channel
conda config --set show_channel_urls true   # Show channel URLs
# Use the Tsinghua mirror for the base channel
conda config --add default_channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
# Use the Tsinghua mirror for the conda-forge channel
conda config --set 'custom_channels.conda-forge' https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

# Install mamba
conda install --yes 'mamba>=0.16'

# Install some commonly used packages
mamba install --yes \
	ipython \
	jupyter \
	jupyterlab \
	matplotlib \
	numpy \
	obspy \
	pandas \
	scipy \
	sphinx \
	xarray
