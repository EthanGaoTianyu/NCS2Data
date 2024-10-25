#!/bin/bash

# Create the installation directory
sudo mkdir -p /opt/intel

# Navigate to Downloads directory
cd ~/Downloads/

# Download the OpenVINO package
sudo wget https://storage.openvinotoolkit.org/repositories/openvino/packages/2022.3.2/linux/l_openvino_toolkit_debian9_2022.3.2.9279.e2c7e4d7b4d_arm64.tgz -O openvino_2022.3.2.tgz

# Extract the package
sudo tar -xf openvino_2022.3.2.tgz

# Move the extracted files to the installation directory
sudo mv l_openvino_toolkit_debian9_2022.3.2.9279.e2c7e4d7b4d_arm64 /opt/intel/openvino_2022.3.2

# Navigate to the Intel directory
cd /opt/intel

# Install OpenVINO dependencies
sudo -E ./openvino_2022.3.2/install_dependencies/install_openvino_dependencies.sh

# Install CMake
sudo apt install -y cmake

# Add OpenVINO environment setup to .bashrc
echo "source /opt/intel/openvino_2022.3.2/setupvars.sh" >> ~/.bashrc

# Source the setup script to apply changes to the current session
source /opt/intel/openvino_2022.3.2/setupvars.sh

# Add the current user to the 'users' group
sudo usermod -a -G users "$(whoami)"
echo "Added $(whoami) to the 'users' group."

# Navigate to OpenVINO's install dependencies directory
cd /opt/intel/openvino_2022.3.2/install_dependencies

# Install the Neural Compute Stick (NCS) dependencies
sudo -E ./install_NCS_dependencies.sh

