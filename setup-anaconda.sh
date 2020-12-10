#!/usr/bin/env bash
#
# Install and setup anaconda
#
# Reference: https://docs.anaconda.com/anaconda/install/silent-mode/
#

set -x -e

installer=Anaconda3-2020.11-MacOSX-x86_64.sh
installdir=${HOME}/.anaconda
shell=zsh

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
cat > requirements.txt << EOF
# developing tools
pytest
pytest-mpl
pytest-cov
# sphinx theme
sphinx_rtd_theme
# needed by pygmt
netcdf4
# seismology
obspy
EOF
conda install --yes --file requirements.txt
rm -f requirements.txt

set +x +e
