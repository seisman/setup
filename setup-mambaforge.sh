#!/usr/bin/env bash
#
# Setup script to install Mambaforge and Python packages
#

# where to install mambaforge
installdir=${HOME}/opt/mambaforge

# the shell name: zsh, bash or csh
shell=$(basename ${SHELL})

# base url for the installer
baseurl=https://github.com/conda-forge/miniforge/releases/latest/download/

# the installer name
if [[ $(uname) == "Linux" ]]; then
	installer=Mambaforge-Linux-x86_64.sh
elif [[ $(uname) == "Darwin" ]]; then
	installer=Mambaforge-MacOSX-x86_64.sh
fi

# Download the installer
wget -c ${baseurl}/${installer} -O ${installer}

# Install miniconda
bash ${installer} -b -p ${installdir}

# Activate conda in current shell
eval "$(${installdir}/bin/conda shell.${shell} hook)"

# Initialize conda and mamba
conda init ${shell}
mamba init ${shell}

# configure conda, changing the ~/.condarc file
conda config --set show_channel_urls true   # Show channel URLs
# Use the Tsinghua mirror for the base channel
conda config --add default_channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
# Use the Tsinghua mirror for the conda-forge channel
conda config --set 'custom_channels.conda-forge' https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

# Install commonly used packages to the base environment
mamba install --yes --file requirements-base.txt
