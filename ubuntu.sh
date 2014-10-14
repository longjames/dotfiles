#!/bin/bash

BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`

#更新源
sudo apt-get update  2>>  err.log

#编译工具
sudo apt-get install -y clang cmake build-essential

# 解决Ubuntu 14.04编译YCM时找不到libclang.so的问题
if [ ! -e /usr/lib/llvm-3.4/lib/libclang.so ]
then
    sudo ln -sf /usr/lib/llvm-3.4/lib/libclang.so.1 /usr/lib/llvm-3.4/lib/libclang.so
elif [ -L /usr/lib/llvm-3.4/lib/libclang.so ]
then
    sudo unlink /usr/lib/llvm-3.4/lib/libclang.so
    sudo ln -sf /usr/lib/llvm-3.4/lib/libclang.so.1 /usr/lib/llvm-3.4/lib/libclang.so
fi

#编辑器
# vim
sudo apt-get install  -y vim-gnome ctags

#版本控制
#git
sudo apt-get install  -y git

#终端增强
#terminator zsh tmux
sudo apt-get install  -y terminator zsh tmux


#安装chromium
sudo apt-get install -y chromium-browser

#安装

#关闭Ubuntu错误报告
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
sudo service apport restart

#修改中文字体为 微米黑
sudo apt-get install  -y ttf-wqy-microhei
sudo ln -sf $BASE_DIR/system/69-language-selector-zh-cn.conf /etc/fonts/conf.d/69-language-selector-zh-cn.conf

#解决ubuntu下Sublime Text 中文输入问题


#Python 开发环境
sudo apt-get install  -y python-dev python-setuptools
sudo easy_install pip
sudo pip install pyflakes pylint pep8

#JavaScript 开发环境

#Ruby 开发环境



# some config needs user password

echo "请输入用户密码:"
chsh -s /usr/bin/zsh   #设置zsh为默认shell
