" General {
" 关闭vi兼容模式
set nocompatible
" 文件类型检测与缩进
filetype plugin indent on
" 检测文件类型
" filetype off
" 设置编码方式
" set encoding=utf-8
" 自动判断编码时 依次尝试一下编码
set fencs=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 设置背景色
set background=dark
" 开启语法高亮功能
syntax enable
syntax on
" 允许buffer在未保存前进行切换
set hidden
" 历史记录数
set history=50
"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

" Vim UI {
    " 显示当前所处的mode
    set showmode
    " hightlight col and line
    set cursorline
    hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE gui=NONE guibg=#2d2d2d guifg=NONE
    " set cursorcolumn
    if has('cmdline_info')
        " 显示标尺
        set ruler
        "标尺格式
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        " 在状态栏显示正在输入的命令
        set showcmd
    endif
    " 显示文件名
    set title
    " 退格符
    set backspace=indent,eol,start
    " No extra spaces between rows
    set linespace=0
    " 显示行号
    set nu
    " ==查找/替换相关的设置==
    " 高亮显示匹配的括号
    set showmatch
    " 匹配括号高亮的时间（单位是十分之一秒）
    set matchtime=5
    " 高亮显示搜索结果
    set hlsearch
    " 在搜索时，输入的词句的逐字符高亮
    " set incsearch
    " 设置搜索时忽略大小写
    set ignorecase
    " case sensitive when uc present
    set smartcase
    " lines to scroll when cursor leaves screen
    " set scrolljump=5
    " minimum lines to keep above and below cursor
    set scrolloff=3
    " Always show the status line
    set laststatus=2
    "命令行下按tab键自动完成
    set wildmode=list:full
    set wildmenu
    " 启动的时候不显示那个援助索马里儿童的提示
    set shortmess=atI
    " 通过使用: command命令，告诉我们文件的哪一行被改变过
    " set report=0
    " 在被分割的窗口间显示空白，便于阅读
    set fillchars=vert:\ ,stl:\ ,stlnc:\
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" }
" Formatting {
    " tab 宽度
    " 设置自动对齐空格数
    set shiftwidth=4
    " 设置Tab宽度
    set tabstop=4
    " 设置自动对齐
    " set autoindent
    " C-style indenting
    set cindent
    " 设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
    " set mouse=a
    " 设置按退格键时可以一次删除4个空格
    set softtabstop=4

    "自动换行
    set wrap
    set smarttab
    set smartindent
    " 将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
    set expandtab
    " 带有如下符号的单词不要被换行分割
    set iskeyword+=_,$,@,%,#,-
    " backspace and cursor keys wrap to
    set whichwrap=b,s,h,l,<,>,[,]
    " 没有错误声
    set noerrorbells
    set winminheight=0
    set virtualedit=onemore
    set novisualbell " 不要闪烁
    set t_vb=
    set completeopt=
" }

" 自动设置目录为正在编辑的文件所在的目录
set autochdir
set tags=tags;

" Auto commands {{{
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}    set ft=markdown
au BufRead,BufNewFile {*.go}                     set ft=go
au BufRead,BufNewFile {*.json}                   set ft=json
au BufRead,BufNewFile {*.rb}                     set ft=ruby

" set for ruby
au BufNewFile,BufRead *.rb set softtabstop=2 | set shiftwidth=2
au FileType ruby set softtabstop=2 | set shiftwidth=2

" Key Mappings {
let mapleader=","

map <C-t> :tabnew<CR>
map <S-H> gT
map <S-L> gt

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" 打开日历快捷键
" map ca :Calendar<cr>
" }

" 自动格式化Go文件
" autocmd BufWritePre *.go :Fmt

" Plugins {

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

Plugin 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

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

syntax on

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

" }

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
