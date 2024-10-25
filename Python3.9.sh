#!/bin/bash

# Set the Python installation directory, modify as needed
PYTHON_INSTALL_DIR="/home/pi/python3.9"

# Update system package list
sudo apt-get update

# Install necessary dependencies
sudo apt-get install -y libbz2-dev libsqlite3-dev libssl-dev

# Download and extract Python 3.9.3 source
wget https://www.python.org/ftp/python/3.9.3/Python-3.9.3.tgz
tar -zxvf Python-3.9.3.tgz

# Navigate into the extracted directory
cd Python-3.9.3

# Configure the build environment, specifying the installation path and enabling optimizations
./configure --prefix=$PYTHON_INSTALL_DIR --enable-optimizations

# Build and install Python
make -j4
sudo make install

# Install Python packages
sudo -H $PYTHON_INSTALL_DIR/bin/python3.9 -m pip install numpy opencv-python matplotlib ipython openvino

# Remove old Python3 and pip3 links
sudo rm -f /usr/bin/pip3
sudo rm -f /usr/bin/python3

# Create new Python3 and pip3 symbolic links
sudo ln -s $PYTHON_INSTALL_DIR/bin/python3.9 /usr/bin/python3
sudo ln -s $PYTHON_INSTALL_DIR/bin/pip3 /usr/bin/pip3

# Verify the installed Python version
python -V
