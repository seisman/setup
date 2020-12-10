#!/usr/bin/env bash
#
# Install anaconda and Python packages
#
# Reference: https://docs.anaconda.com/anaconda/install/silent-mode/
#

set -x -e

# the Anaconda installer
installer=Anaconda3-2020.11-MacOSX-x86_64.sh
# location to install anaconda
installdir=${HOME}/.anaconda
# the default shell
shell=zsh

# Download Anaconda installer
wget -c https://repo.anaconda.com/archive/${installer} -O ${installer}

# Install Anaconda
bash ${installer} -b -p ${installdir}

# Activate conda in current shell
eval "$(${installdir}/bin/conda shell.${shell} hook)"

# Init
conda init ${shell}

# Add conda-forge channel
conda config --add channels conda-forge

# Update conda
conda update --yes conda

# Install packages
conda install --yes --file requirements.txt

set +x +e
