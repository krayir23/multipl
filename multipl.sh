#!/bin/bash

sleep 1
echo -e '\e[0;32m'
echo " _  ______      _ __   _____ ____    _   _  ___  ____  _____ ";
echo "| |/ /  _ \    / \\ \ / /_ _|  _ \  | \ | |/ _ \|  _ \| ____|";
echo "| ' /| |_) |  / _ \\ V / | || |_) | |  \| | | | | | | |  _|  ";
echo "| . \|  _ <  / ___ \| |  | ||  _ <  | |\  | |_| | |_| | |___ ";
echo "|_|\_\_| \_\/_/   \_\_| |___|_| \_\ |_| \_|\___/|____/|_____|";
echo ""
echo -e '\e[0m' 
sleep 3
sleep 2


echo "System updating..."
sudo apt update && sudo apt upgrade -y

echo "Downloading..."
wget https://cdn.app.multiple.cc/client/linux/x64/multipleforlinux.tar -O multipleforlinux.tar

echo "Extracting files..."
tar -xvf multipleforlinux.tar

cd multipleforlinux

echo "Granting permissions..."
chmod +x ./multiple-cli
chmod +x ./multiple-node

echo "Adding directory to system PATH..."
echo "PATH=\$PATH:$(pwd)" >> ~/.bash_profile
source ~/.bash_profile

echo "Setting permissions..."
chmod -R 777 $(pwd)

echo "Launching multiple-node..."
nohup ./multiple-node > output.log 2>&1 &

echo "Enter identification code and a PIN:"
read -p "Account ID: " IDENTIFIER
read -p "Set your PIN: " PIN

echo "Binding account with ID: $IDENTIFIER and PIN: $PIN..."
multiple-cli bind --bandwidth-download 100 --identifier $IDENTIFIER --pin $PIN --storage 200 --bandwidth-upload 100

echo "Installation complete."
echo "Krayir Node"