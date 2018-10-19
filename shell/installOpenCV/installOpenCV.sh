#!/bin/bash

echo "Install Opencv"

InstallDIR=~/opencv

sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

echo "新建下载opencv文件夹,默认是~/opencv"


if [ -d $InstallDIR ];then
   echo "文件夹已存在"
else
   mkdir ~/opencv
fi

cd $InstallDIR


echo "下载opencv..."
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git


cd $InstallDIR
mkdir mybuildDIR
cd mybuildDIR

echo "cmake..."
cmake -DBUILD_opencv_xfeatures2d=OFF -D WITH_IPP=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=$InstallDIR/opencv_contrib/modules ..

echo "make -j4"
make -j4

sudo make install


