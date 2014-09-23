#!/bin/bash

BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`

#安装字体文件
echo "正在安装字体..."
mkdir -p $HOME/.fonts
ln -fs $BASE_DIR/fonts/* $HOME/.fonts/
fc-cache -vf #刷新系统字体缓存

#建立zshrc链接
echo "配置zsh..."
for i in $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.dir_colors
do [ -L $i ] && unlink $i
done
for i in $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.dir_colors
do [ -e $i ] && mv $i $i.$TODAY
done

ln -s $BASE_DIR/zsh/zshrc $HOME/.zshrc
ln -s $BASE_DIR/zsh/oh-my-zsh $HOME/.oh-my-zsh
ln -s $BASE_DIR/zsh/dircolors.256dark $HOME/.dir_colors

#建立tmux配置链接
echo "配置tmux..."
if [ -L $HOME/.tmux.conf ];then
    unlink $HOME/.tmux.conf
elif [ -f $HOME/.tmux.conf ];then
    mv $HOME/.tmux.conf $HOME/.tmux.conf.$TODAY
fi
ln -s $BASE_DIR/tmux/tmux.conf $HOME/.tmux.conf

#建立terminator配置链接
mkdir -p $HOME/.config/terminator
echo "配置terminator..."
mkdir -p $HOME/.config/terminator
if [ -L $HOME/.config/terminator/config ];then
    unlink $HOME/.config/terminator/config
elif [ -f $HOME/.config/terminator/config ];then
    mv $HOME/.config/terminator/config $HOME/.config/terminator/config.$TODAY
fi
ln -s $BASE_DIR/terminator/config $HOME/.config/terminator/config

#建立gitconfig链接
echo "配置Git..."
if [ -L $HOME/.gitconfig ];then
    unlink $HOME/.gitconfig
elif [ -f $HOME/.gitconfig ];then
    mv $HOME/.gitconfig $HOME/.gitconfig.$TODAY
fi
ln -s $BASE_DIR/git/gitconfig $HOME/.gitconfig

#配置Vim
echo "备份vim配置..."
for i in $HOME/.vim $HOME/.vimrc $HOME/.vimrc.bundles
do [ -L $i ] && unlink $i
done
for i in $HOME/.vim $HOME/.vimrc $HOME/.vimrc.bundles
do [ -e $i ] && mv $i $i.$TODAY
done

echo "重新配置Vim..."
ln -s $BASE_DIR/vim/vimrc $HOME/.vimrc
ln -s $BASE_DIR/vim/vimrc.bundles $HOME/.vimrc.bundles
ln -s $BASE_DIR/vim/ $HOME/.vim

echo "安装插件..."
if [ ! -e $BASE_DIR/vim/bundle/vundle ]
then
    echo "安装Vundle..."
    git clone https://github.com/gmarik/vundle.git $BASE_DIR/vim/bundle/vundle
else
    echo "升级Vundle..."
    cd "$BASE_DIR/vim/bundle/vundle" && git pull origin master
fi

echo "使用Vundle安装/升级插件..."
system_shell=$SHELL
export SHELL="/bin/sh"
echo "正在从GitHub上下载插件..." >> $BASE_DIR/notice
echo "请保持网络畅通，耐心等待 :-)" >> $BASE_DIR/notice
vim -u $HOME/.vimrc.bundles $BASE_DIR/notice +BundleInstall! +BundleClean +qall
rm $BASE_DIR/notice

echo "编译YouCompleteMe..."
echo "请保持网络畅通，这可能会花费较长时间"
echo "编译会占用很多系统资源 :-)"
echo "若安装失败，请先检查依赖关系，再手动安装"
cd $BASE_DIR/vim/bundle/YouCompleteMe/
if [ `which clang` ]
then
    bash -x install.sh --clang-completer --system-libclang
else
    bash -x install.sh --clang-completer
fi

export SHELL=$system_shell
#Vim配置完成

echo "Config completed, just enjoy!"
