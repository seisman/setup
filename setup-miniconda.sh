#!/usr/bin/env bash
#
# Install miniconda and Python packages
#
# Reference: https://docs.anaconda.com/anaconda/install/silent-mode/
#

set -x -e

# the miniconda installer
installer=Miniconda3-latest-MacOSX-x86_64.sh
# location to install miniconda
installdir=${HOME}/.miniconda
# the default shell
shell=zsh

# Download miniconda installer
wget -c https://repo.anaconda.com/miniconda/${installer} -O ${installer}

# Install miniconda
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
