" 关闭vi兼容模式
set nocompatible

" 显示行号
set number

" Always show the status line
set laststatus=2
" 设置在编辑过程中右下角显示光标的行列信息
set ruler
" 在状态栏显示正在输入的命令
set showcmd

" 设置自动对齐
set autoindent
set cindent
set hidden

" 开启语法高亮功能
syntax enable
syntax on

" 设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
" 设置Tab宽度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
" 设置按退格键时可以一次删除4个空格
set softtabstop=4
" 设置按退格键时可以一次删除4个空格
set smarttab
" 将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
" 设置编码方式
set encoding=utf-8
" 自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 自动设置目录为正在编辑的文件所在的目录
set autochdir
set tags=tags;
" 检测文件类型
" filetype off
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 通过使用: command命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=10
" 不要闪烁
set novisualbell

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

" ==查找/替换相关的设置==
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 高亮显示搜索结果
set hlsearch
" 在搜索时，输入的词句的逐字符高亮
set incsearch
" 设置搜索时忽略大小写
set ignorecase

" 不让vim发出滴滴声
set noerrorbells

" hightlight col and line
set cursorline
" set cursorcolumn

" Auto commands {{{
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}    set ft=markdown
au BufRead,BufNewFile {*.go}                     set ft=go
au BufRead,BufNewFile {*.json}                   set ft=json
au BufRead,BufNewFile {*.rb}                     set ft=ruby

" set for ruby
au BufNewFile,BufRead *.rb set softtabstop=2 | set shiftwidth=2
au FileType ruby set softtabstop=2 | set shiftwidth=2

" Key map
map <C-t> :tabnew<CR>
map <S-H> gT
map <S-L> gt

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

let mapleader=","

" 自动格式化Go文件
" autocmd BufWritePre *.go :Fmt

" Plugin

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Other pulgins
" quickly move cursor, try ,,w
Plugin 'Lokaltog/vim-easymotion'

" Git
Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

Plugin 'fatih/vim-go'
au FileType go nmap <Leader>k <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

Plugin 'tomasr/molokai'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'tpope/vim-rails.git'
" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete

Plugin 'scrooloose/nerdtree'
nmap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapRefreshRoot='<F5>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'

Plugin 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" quickly write HTML, just like zencoding but simple engough
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"let g:sparkupNextMapping= "<c-m>"
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
let g:user_emmet_mode='iv'
autocmd FileType html,css,eruby EmmetInstall

Plugin 'bling/vim-airline'
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

" quickly search file(s), use ctrl+p, F5 refresh
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore='\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules)$'
map <c-o> :CtrlPBuffer<CR>

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'kristijanhusak/vim-multiple-cursors'
" select: Ctrl + n, select next: Ctrl + n ,  then s to edit
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

filetype plugin indent on     " required!
syntax on

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-

" 设置配色方案
" if (has("gui_running"))
"   colorscheme torte
" else
"   colorscheme ron
" endif
" 指定配色方案为256色
set t_Co=256
set background=dark
" colorscheme solarized
colorscheme molokai
let g:molokai_original = 1
" colorscheme desert

" clear trailing spaces when u save
autocmd BufWritePre * :%s/\s\+$//e

" 新建.c,.h,.sh,.java,py文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件

  if &filetype == 'sh'
    call setline(1,"\#########################################################################")
    call append(line("."), "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: jiemoon")
    call append(line(".")+2, "\# mail: jiemoon2010@gmail.com")
    call append(line(".")+3, "\# Created Time: ".strftime("%c"))
    call append(line(".")+4, "\#########################################################################")
    call append(line(".")+5, "\#!/bin/bash")
    call append(line(".")+6, "")
  elseif &filetype == 'python'
    call setline(1,"\#!/usr/bin/env python")
    call append(line("."),"\#-*- coding: utf-8 -*- ")
    call append(line(".")+1,"\#Author:  jiemoon <jiemoon2010@gmail.com>")
    call append(line(".")+2,"")
  else
    call setline(1, "/*************************************************************************")
    call append(line("."), "    > File Name: ".expand("%"))
    call append(line(".")+1, "    > Author: jiemoon")
    call append(line(".")+2, "    > Mail: jiemoon2010@gmail.com ")
    call append(line(".")+3, "    > Created Time: ".strftime("%c"))
    call append(line(".")+4, " ************************************************************************/")
    call append(line(".")+5, "")
  endif
  if &filetype == 'c'
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "")
  endif

  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G
endfunc
