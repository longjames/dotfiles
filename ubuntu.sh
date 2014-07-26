#!/bin/bash

BASE_DIR=`pwd`
TODAY=`data +%Y%m%d%H%M%S`

#更新源
sudo apt-get update

#编辑器
# vim, sublime-text
sudo apt-get install vim-gnome sublime-text

#版本控制
#git
sudo apt-get install git

#终端增强
#terminator zsh tmux
sudo apt-get install terminator zsh tmux

#安装chromium
sudo apt-get install chromium-browser

#安装

#关闭Ubuntu错误报告
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
sudo service apport restart

#修改中文字体为 微米黑
sudo apt-get install ttf-wqy-microhei
sudo ln -sf $BASE_DIR/system/69-language-selector-zh-cn.conf /etc/fonts/conf.d/69-language-selector-zh-cn.conf

#解决ubuntu下Sublime Text 中文输入问题


#Python   开发环境

#JavaScript 开发环境

#Ruby 开发环境
