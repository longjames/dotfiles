---------------------------------

# 自定义快捷键

    快捷键说明

        1. 上排F功能键

            F1 废弃这个键,防止调出系统帮助
            F2 set nu/nonu,行号开关，用于鼠标复制代码用
            F3 set list/nolist,显示可打印字符开关
            F4 set wrap/nowrap,换行开关
            F5 compilerun() 编译/运行

        2. 分屏移动

            ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl

        3. buffer/tab相关

            , + tn  新tab
            , + to  tabonly
            , + tc  close
            , + tm  tab move
            , + te  new tab edit

        4. 按键修改

            U      =  ctrl-r   redo
            , + sa =  ggVG  全选
            H      =  0  移动光标至行首
            L      =  $  移动光标至行尾
            Y      =  y$ 复制到行尾

---------------------------------

---------------------------------

# 插件部分

> 基础

1. ####插件管理 [gmarik/vundle](https://github.com/gmarik/vundle)

    必装,用于管理所有插件
    命令行模式下管理命令:

        :BundleInstall     install
        :BundleInstall!    update
        :BundleClean       remove plugin not in list

2. ####多语言语法检查 [scrooloose/syntastic](https://github.com/scrooloose/syntastic)

    建议安装，静态语法及风格检查,支持多种语言

    修改了下标记一列的背景色,原有的背景色在solarized下太难看了…..

    演示

    ![syntastic](https://github.com/wklken/gallery/blob/master/vim/syntastic.png?raw=true)

> 自动补全

3. ####代码自动补全 [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

    必装，强烈推荐(YCM是我目前用到的最好的自动补全插件)

    需要编译这个插件(见github文档)

    这个需要自己去看官方的配置方式,演示在官方github有

    需要Vim 7.3.584 以上版本([如何编译vim](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source))

    这个插件包含了以下几个插件功能,所以不需要装下面:

        clang_complete
        AutoComplPop
        Supertab
        neocomplcache
        jedi(对python的补全)

    快捷键:

        ,gd  跳到声明位置, 仅 filetypes: c, cpp, objc, objcpp, python 有效


4. ####引号配对补全 [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)

    必装，输入引号,括号时,自动补全

    对python的docstring 三引号做了处理(只处理""", '''暂时没配，可以自己加)

    演示

    ![delimitmate](https://github.com/wklken/gallery/blob/master/vim/delimate.gif?raw=true)

    附:同类插件 [kana/vim-smartinput](https://github.com/kana/vim-smartinput)


5. ####html/xml标签配对补全 [docunext/closetag.vim](https://github.com/docunext/closetag.vim)


> 快速编码

6. ####快速注释 [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)

    必装，另一个大大提升效率的地方，快速批量加减注释

        [d] shift+v+方向键选中(默认当前行)
            ->  ,cc  加上注释
            -> ,cu 解开注释

    演示

    ![nerdcommenter](https://github.com/wklken/gallery/blob/master/vim/nerdcomment.gif?raw=true)


    附:注释还有其他两种插件可选[tcomment](https://github.com/tomtom/tcomment_vim) 和[tpope/vim-commentary](https://github.com/tpope/vim-commentary)

7. ####去行尾空格 [bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)

    将代码行最后无效的空格标红

        [sd] ,空格    去掉当前行末尾空格

8. ####赋值语句代码对齐 [godlygeek/tabular](https://github.com/godlygeek/tabular)

    将代码,或者json等,进行对齐,具体见 [tabular-vim](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)

        [sd]  可以选中多行,不选中默认操作当前行
            ,a= 对齐等号表达式
            ,a: 对齐冒号表达式(json/map等)

> 快速移动

9. ####位置跳转[Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)

    必装，效率提升杀手锏，跳转到光标后任意位置

    配置(我的leader键配置 let g:mapleader = ',')

        ,, + w  跳转
        ,, + fe  查找'e',快速跳转定位到某个字符位置

    演示

    ![easy_motion](https://github.com/wklken/gallery/blob/master/vim/easymotion.gif?raw=true)


10. ####mark跳转 [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)


> 快速选中

11. ####区块伸缩 [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)

    视图模式下可伸缩选中部分，用于快速选中某些块

        [sd]
        + 增加选中范围(+/=按键)
        _ 减少选中范围(_/-按键)

    演示（直接取链到其github图)

    ![expand-region](https://raw.github.com/terryma/vim-expand-region/master/expand-region.gif)


12. ####多光标选中编辑 [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

    多光标批量操作

        [sd]
        ctrl + m 开始选择
        ctrl + p 向上取消
        ctrl + x 跳过
        esc   退出

    演示(官方演示图)

    ![multiple-cursors](https://raw.github.com/terryma/vim-multiple-cursors/master/assets/example1.gif)

> 功能相关

13. ####搜索 [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

    文件搜索,ack/Command-T需要依赖于外部包,不喜欢有太多依赖的,除非十分强大, 具体 [文档](http://kien.github.io/ctrlp.vim/)

        [sd] ,p  打开ctrlp搜索
        [sd] ,f  相当于mru功能，show recently opened files

        ctrl + j/k 进行上下移动
        ctrl + x/v 分屏打开该文件
        ctrl + t   在新tab中打开该文件

    演示

    ![ctrip](https://github.com/wklken/gallery/blob/master/vim/ctrlp.gif?raw=true)

    插件:
    当前文件快速函数搜索:[tacahiroy/ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

    解决问题:使用tagbar当函数比较多的时候,移动耗时较长,使用快速搜索快很多

        ,fu   进入当前文件函数搜索
        ,fU   搜索光标下单词对应函数



14. ####git 常用操作 [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

    git插件, 编辑文件时进行一些diff操作,例如diff

    不是很习惯,所以用的次数太少,目前和现有配置快捷键有冲突,尚未解决

        [sd]
        ,ge   = git diff edit[gd被ycm占用了]

    没有配置其他快捷键,可以参照github,自己增加修改映射

15. ####git状态 [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

    git,在同一个文件内,通过标记和高亮,显示本次文件变更点

        [sd]
        ,gs   = show diff status [gd被ycm占用了]

    ![gitgutter](https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png)

16. ####文件时光机 [sjl/gundo.vim](https://github.com/sjl/gundo.vim)

    编辑文件时光机

        [sd] ,h  查看文件编辑历史

    附:同类插件 [mbbill/undotree](https://github.com/mbbill/undotree)

> 显示增强


17. ####状态栏增强 [bling/vim-airline](https://github.com/bling/vim-airline)


    演示

    ![airline](https://raw.githubusercontent.com/wiki/bling/vim-airline/screenshots/demo.gif)

18. ####括号上色高亮 [kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)

    演示

    ![rainbow](https://github.com/wklken/gallery/blob/master/vim/rainbow_parentheses.png?raw=true)


> 快速导航

19. ####目录树 [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

    必装,开启目录树导航

        [sd]
            ,n  打开 关闭树形目录结构

            在nerdtree窗口常用操作：(小写当前，大写root)
            x.......收起当前目录树
            X.......递归收起当前目录树
            r.......刷新当前目录
            R.......刷新根目录树

            p.......跳到当前节点的父节点
            P.......跳到root节点
            k/j.....上下移动
            K.......到同目录第一个节点
            J.......最后一个节点

            o.......Open files, directories and bookmarks
            i.......split上下分屏
            s.......vsplit左右分屏
            c.......将当前目录设为根节点
            q.......关闭


    演示

    ![thenerdtree](https://github.com/wklken/gallery/blob/master/vim/thenerdtree.gif?raw=true)

20. ####Buffer [fholgado/minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim)

    必装，buffer管理, 可以查找其他同类插件

        [sd]
            <Tab>  切换buffer
            左右方向键  切换buffer
            ,bn   切到后一个
            ,bp   切到前一个
            ,bd   关闭当前buffer

21. ####Tag [majutsushi/tagbar](https://github.com/majutsushi/tagbar)

    必装,标签导航,纬度和taglist不同, taglist的替代者

    注意:之前版本有装taglist,决定用tagbar替代,taglist的配置注解未删除,需要的自行打开

         [sd] <F9> 打开

    演示

    ![tagbar](https://github.com/wklken/gallery/blob/master/vim/tagbar.gif?raw=true)

