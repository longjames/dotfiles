#!/bin/bash

CURRENT_DIR=`pwd`
TODAY=`date +%Y%m%d`

#安装字体文件
echo "正在安装字体..."
mkdir -p $HOME/.fonts
ln -s $CURRENT_DIR/fonts/* $HOME/.fonts/
fc-cache -vf #刷新系统字体缓存

#建立bashrc链接
echo "配置bash..."
if [ -f $HOME/.bashrc ]
then
    mv $HOME/.bashrc $HOME/.bashrc.$TODAY
fi
ln -s $CURRENT_DIR/bashrc $HOME/.bashrc

#建立terminator配置链接
echo "配置terminator..."
if [ -f $HOME/.config/terminator/config ]
then
    mv $HOME/.config/terminator/config $HOME/.config/terminator/config.$TODAY
fi
ln -s $CURRENT_DIR/terminator/config $HOME/.config/terminator/config

#建立gitconfig链接
echo "配置Git..."
if [ -f $HOME/.gitconfig ]
then
    mv $HOME/.gitconfig $HOME/.gitconfig.$TODAY
fi
ln -s $CURRENT_DIR/gitconfig $HOME/.gitconfig

#配置Vim
echo "备份vim配置..."
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$TODAY; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -L $i ] && unlink $i ; done

echo "重新配置Vim..."
ln -s $CURRENT_DIR/vimrc $HOME/.vimrc
ln -s $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
ln -s $CURRENT_DIR/vim/ $HOME/.vim



