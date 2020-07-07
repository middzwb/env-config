call plug#begin('~/.vim/plugged')
Plug 'inkarkat/vim-mark'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/taglist.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/a.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
call plug#end()

"winpos 5 5          " 设定窗口位置
"set lines=40 columns=155    " 设定窗口大小
syntax enable
syntax on
""set list
""set listchars=tab:>-,trail:-
set nu              " 显示行号
set go=             " 不要图形按钮
set guifont=DejaVu_Sans_Mono:h12:cANSI   " 设置字体
""autocmd InsertLeave * se nocul  " 离开插入模式后，取消下划线
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set showcmd         " 输入的命令显示出来，看的清楚些
set cmdheight=2 " 命令行（在状态行下）的高度，默认为1，这里是2
set novisualbell    " 不要闪烁(不明白)
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
if version >= 603 " 显示中文帮助
        set helplang=cn
        set encoding=utf-8
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set expandtab " 用空格代替制表符
autocmd Filetype python set expandtab
set autoindent " 自动缩进
set cindent
set smartindent
set tabstop=4 " Tab键的宽度
set softtabstop=4 " 统一缩进为4
set shiftwidth=4
set smarttab " 在行和段开始处使用制表符
set autoread " 设置当文件被改动时自动载入
autocmd FileType c,cpp,cc map <buffer> <leader><space> :w<cr>:make<cr> " quickfix模式
set completeopt=preview,menu "代码补全
filetype plugin on "允许插件
set clipboard+=unnamed "共享剪贴板
:set makeprg=g++\ -Wall\ \ % "make 运行
set autowrite "自动保存
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set noeb " 去掉输入错误的提示声音
set confirm " 在处理未保存或只读文件的时候，弹出确认
set history=1000 " 历史记录数
set nobackup "禁止生成临时文件
set noswapfile
set ignorecase "搜索忽略大小写
set hlsearch "搜索逐字符高亮
set incsearch
set gdefault "行内替换
set enc=utf-8 "编码设置
set langmenu=zh_CN.UTF-8 "语言设置
set helplang=cn
filetype on " 侦测文件类型
filetype plugin on " 载入文件类型插件
filetype indent on " 为特定文件类型载入相关缩进文件
set viminfo+=! " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set linespace=0 " 字符间插入的像素行数目
set wildmenu " 增强模式中的命令行自动完成操作
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"       set mouse=a
"       set selection=exclusive
"       set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
""set showmatch " 高亮显示匹配的括号
" 匹配括号高亮的时间（单位是十分之一秒）
"set matchtime=1
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"自动补全
inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
""inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" plugin

" tag list的设定
""autocmd FileType java set tags+=D:\tools\java\tags
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags
autocmd BufReadPost * if line("'\"")>0&&line("'\"")<=line("$") | exe "normal g'\"" | endif
""set tags=/home/z19052/ceph-L/src/tags
let Tlist_Auto_Open=1 "默认打开Taglist
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags"

" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_tab_guides = 0
colorscheme desert

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
""let g:airline#extensions#tabline#show_splits = 1
""let g:airline#extensions#tabline#show_buffers = 1
""let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '' " doc/airline.txt
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

set t_Co=256
set cc=120

" cpp enhance
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

" indent line
let g:indentLine_enables = 1
""let g:indentLine_char="|"

" ale
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \   'csh': ['shell'],
            \   'zsh': ['shell'],
            \   'bash': ['shellcheck'],
            \   'go': ['gofmt', 'golint'],
            \   'python': ['flake8', 'mypy', 'pylint'],
            \   'c': ['gcc', 'cppcheck', 'clang'],
            \   'cpp': ['gcc', 'cppcheck'],
            \ }
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
"let g:ale_sign_column_always = 1
let g:ale_sign_error = ">>"
let g:ale_sign_warning = '--'
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

""set foldmethod=indent
""set nofoldenable

" shortcut
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

""nnoremap <F2> :g/^\s*$/d<CR> "去空行
"比较文件
nnoremap <C-F2> :vert diffsplit
"新建标签
map <A-F2> :tabnew<CR>
"列出当前目录文件
map <F5> :tabnew .<CR>
"打开树状文件目录
map <C-F3> \be
nnoremap <F2> :A<cr>
"inoremap <F2> <C-N>
nnoremap <F3> <C-W>w
set pastetoggle=<F4>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
nnoremap <F6> :Tlist<cr> <C-W>w
nnoremap m ]c
nnoremap <S-m> [c
""nnoremap <S-tab> :bn<CR>
""set mouse=a
highlight Pmenu ctermbg=darkgrey ctermfg=black
highlight PmenuSel ctermbg=lightgrey ctermfg=black

set rtp+=~/tabnine-vim
