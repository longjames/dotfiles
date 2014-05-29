"==========================================
"加载插件
"==========================================

"修改leader键
let mapleader = ','
let g:mapleader = ','

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

"
"==========================================
" General 基础设置
"==========================================

" history存储长度。
set history=2000


filetype on                 "检测文件类型
filetype indent on          "针对不同的文件类型采用不同的缩进格式
filetype plugin on          "允许插件
filetype plugin indent on   "启动自动补全

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread                " 文件修改之后自动载入。
set shortmess=atI           " 启动的时候不显示那个援助索马里儿童的提示

set cursorcolumn            " 突出显示当前行等 不喜欢这种定位可注解
set cursorline              " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
"
set t_ti= t_te=


"- 则点击光标不会换,用于复制
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排版等界面格式设置
"==========================================

set wildignore=*.swp,*.bak,*.pyc,*.class

set ruler               "显示当前的行号列号：
set showcmd             "在状态栏显示正在输入的命令
set showmode            "Show current mode

"在上下移动光标时，光标上方或下方至少会保留显示的行数
set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2


set number                    "显示行号：
set nowrap                    " 取消换行。

set showmatch                 "括号配对情况
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

"Smart indent
set smartindent
set autoindent    "打开自动缩进

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4             " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"==========================================
" file encode, 文件编码,格式
"==========================================
set encoding=utf-8            " 设置新文件的编码为 UTF-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn               "language message zh_CN.UTF-8

set ffs=unix,dos,mac          " Use Unix as the standard file type

"如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
"合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost ~/.vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

"==========================================
"HotKey  自定义快捷键
"==========================================
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

noremap <F1> <Esc>"
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>


"use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
map <Leader>sa ggVG"

"  ------------------------tab/buffer 相关
"Use arrow key to change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" tabnext  tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"  -----------------------选中及操作改建
"  调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" Y复制到行尾
map Y y$

"新建某些类型文件时，自动插入相应文件头
autocmd BufNewFile  *.sh,*.py  exec ":call SetTitle()"

"定义函数SetTitle，自动插入文件头
func! SetTitle ()
    if &filetype == 'sh'                    "如果文件类型为.sh文件
        call setline(1,"#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"#coding=utf-8")
        call append(line(".")+1, "")
"    else
        "call setline(1,          "/*************************************************************************")
        "call append(line("."),   "      > File Name: ".expand("%"))
        "call append(line(".")+1, "      > Author: 房文同")
        "call append(line(".")+2, "      > Mail: fangwentong2012@gmail.com")
        "call append(line(".")+3, "      > Encoding:  utf-8")
        "call append(line(".")+4, "      > Created Time: ".strftime("%c"))
        "call append(line(".")+5, " ************************************************************************/")
        "call append(line(".")+6, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "#include<iostream>")
        call append(line("."), "using namespace std;")
        call append(line(".")+1, "")
    endif
    if &filetype == 'c'
        call setline(1, "#include<stdio.h>")
        call append(line("."), "")
    endif
    "if &filetype == 'java'
            "call append(line(".")+6,"public class ".expand("%"))
            "call append(line(".")+7,"")
    "endif
    "新建文件后，自动定位到文件末尾
    normal G
    normal o
endfunc



"C，C++, shell, python, javascript, ruby...等按F5运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
        exec "!rm ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
        exec "!rm ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        "exec "!firefox % &"
        exec "!chrome % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd' "MarkDown 解决方案为Chrome浏览器的MarkDown Preview Plus插件，保存后实时预览
        exec "!chrome % &"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'ruby'
        exec "!time ruby %"
    endif
endfunc

"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 修改主题和颜色展示
colorscheme solarized
set background=dark
set t_Co=256

"colorscheme molokai
"colorscheme desert

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

