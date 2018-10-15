#!/bin/bash

echo "Configure Ubuntu repositories"
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

echo "Setup sources.list"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "Set up keys"
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo "Install ROS"
sudo apt-get update
sudo apt-get install ros-kinetic-desktop -y

echo "Initialize rosdep"
sudo rosdep init
rosdep update

echo "Environment setup"
echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

echo "Dependencies for building packages"
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

echo "Install complete"
