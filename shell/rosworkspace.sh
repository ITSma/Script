#!/bin/bash

source /opt/ros/kinetic/setup.zsh

USERPATH=~/

cd $USERPATH

read -p "输入工作空间名:" DIR

if [ -z $DIR ];then
    echo "使用默认目录名catkin_ws"
    DIR=/home/illusion/catkin_ws
fi

if [ -e $DIR ];then
    echo "已存在该目录"
    exit 1
else
    echo "创建工作区"
fi

mkdir -p $USERPATH/$DIR/src

if [ -e $DIR/src ];then
    cd $USERPATH/$DIR/src
    catkin_init_workspace
    cd $USERPATH/$DIR
    catkin_make
else
    echo "创建失败"
    exit 1
fi

echo "source $USERPATH/$DIR/devel/setup.zsh" >> ~/.zshrc
