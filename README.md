#My dotfiles

##关于

此仓库存放的是一些linux常用的配置文件，
通过软链接建立与系统配置文件的联系（系统的相关配置文件通过软链接指向该仓库中的文件).
如 `~/.vimrc` ->  `repo_path/vim/vimrc`.

通过一个仓库管理这些配置文件的优势主要有：

- 借助编写的shell脚本，可实现系统配置的快速部署.
- 修改系统配置文件后，这些更改能直接反应到git工作目录中，借助git，可以高效地管理这些更改.
- 依托GitHub等平台，实现配置备份与共享.



##列表

1. 相关字体配置
    - Monaco : Mac终端默认的等宽字体，用它来替代Ubuntu终端的默认字体.
    - <del>文泉驿微米黑</del> : 一款开源中文字体，待添加.

2. `zsh`配置

    借助 [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) 配置zsh

3. `tmux`配置

4. `terminator`配置

    参见[这篇文章](http://www.fangwentong.com/2014/05/work-with-terminator/)

5. `vim` 配置

    原型来自 [wklken/k-vim](https://github.com/wklken/k-vim) ,经过自己多次整理，得到现有的vim配置.

    VIM插件&快捷键说明：

        TODO.


##安装

1. clone本仓库到本地

        git clone https://github.com/fangwentong/dotfiles.git

2. 安装依赖的包

        # ubuntu
        sudo apt-get install ctags
        sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖

        # mac
        brew install ctags

        #使用python需要
        sudo pip install pyflakes
        sudo pip install pylint
        sudo pip install pep8

3. 更新子模块并开始安装

        cd dotfiles
        git submodule update --init
        sh -x install.sh


##更多

获取`dotfiles`的更多信息，可以访问[http://dotfiles.github.io/](http://dotfiles.github.io/)
