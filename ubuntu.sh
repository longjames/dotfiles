#!/bin/bash

BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`

#更新源
sudo apt-get update  2>>  err.log

#编译工具
sudo apt-get install -y clang cmake build-essential 2>> err.log

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
sudo apt-get install  -y vim-gnome ctags 2>> err.log

#版本控制
#git
sudo apt-get install  -y git 2>> err.log

#终端增强
#terminator zsh tmux
sudo apt-get install  -y terminator zsh tmux 2>> err.log


#安装chromium
sudo apt-get install -y chromium-browser 2>> err.log

#安装

#关闭Ubuntu错误报告
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
sudo service apport restart

#修改中文字体为 微米黑
sudo apt-get install  -y ttf-wqy-microhei 2>> err.log
sudo ln -sf $BASE_DIR/system/69-language-selector-zh-cn.conf /etc/fonts/conf.d/69-language-selector-zh-cn.conf

#解决ubuntu下Sublime Text 中文输入问题


#Python 开发环境
sudo apt-get install  -y python-dev python-setuptools 2>> err.log
sudo easy_install pip
sudo pip install pyflakes pylint pep8

#JavaScript 开发环境
sudo apt-get install -y nodejs-legacy npm 2>> err.log

#Ruby 开发环境
sudo apt-get install -y ruby-dev 2>> err.log
#sudo gem install jekyll
#sudo gem install rails

#PHP 开发环境
#sudo apt-get install -y apache2 mysql-server
#sudo apt-get install -y php5 libapache2-mod-php5
#sudo apt-get install -y sudo apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

