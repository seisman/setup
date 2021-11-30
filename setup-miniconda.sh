#!/usr/bin/env bash
#
# Install miniconda and Python packages
#
# Reference: https://docs.anaconda.com/anaconda/install/silent-mode/
#
# location to install miniconda
installdir=${HOME}/opt/miniconda
# mirror to download miniconda
# MIRROR=https://repo.anaconda.com/miniconda/
MIRROR=https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/
# the default shell (zsh, bash or csh)
shell=zsh

# the miniconda installer
if [[ $(uname) == "Linux" ]]; then
	installer=Miniconda3-latest-Linux-x86_64.sh
elif [[ $(uname) == "Darwin" ]]; then
	installer=Miniconda3-latest-MacOSX-x86_64.sh
fi
echo ${installer}

# Download miniconda installer
wget -c ${MIRROR}/${installer} -O ${installer}

# Install miniconda
bash ${installer} -b -p ${installdir}

# Activate conda in current shell
eval "$(${installdir}/bin/conda shell.${shell} hook)"

# Initialize conda (run this if this is the first time you install miniconda)
# conda init ${shell}

# Add conda-forge channel
conda config --add channels conda-forge

# Install mamba
conda install --yes 'mamba>=0.16'

# Install some commonly used packages
mamba install --yes ipython jupyter matplotlib numpy obspy pandas scipy sphinx xarray
