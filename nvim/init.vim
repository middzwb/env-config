" ########### PLUGIN-LIST BEGIN ###########
call plug#begin('~/.vim/plugged')

" 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 状态栏
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" buffer栏
Plug 'mengelbrecht/lightline-bufferline'
" c++语法检查
" Plug 'dense-analysis/ale'
" 对齐线
Plug 'Yggdroot/indentLine'
" git
Plug 'tpope/vim-fugitive'
" 自动括号
Plug 'jiangmiao/auto-pairs'
" 🌈括号
if has('nvim')
    Plug 'p00f/nvim-ts-rainbow'
else
    Plug 'luochen1990/rainbow'
endif
" 多光标
Plug 'mg979/vim-visual-multi'
" 对齐
Plug 'junegunn/vim-easy-align', {'on': ['EasyAlign', '<Plug>(EasyAlign)']}
" 悬浮终端
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " text object
    " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " refactor
    " Plug 'nvim-treesitter/nvim-treesitter-refactor'
    " context
    " Plug 'romgrk/nvim-treesitter-context'
else
    Plug 'octol/vim-cpp-enhanced-highlight'
endif

" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}

" coc插件
let g:coc_global_extensions = [
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-sh',
    \ 'coc-yaml',
    \ 'coc-cmake',
    \ 'coc-snippets',
    \ 'coc-clangd',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-word',
    \ 'coc-sh',
    \ 'coc-just-complete'
    \ ]

call plug#end()
" ########### PLUGIN-LIST END ###########

" ########### BASE-CONFIG ###########

syntax enable
syntax on
set nu
set guifont=DejaVu_Sans_Mono:h12:cANSI   " 设置字体
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set nocompatible
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
set completeopt=longest,menu "代码补全  "set completeopt=preview,menu preview会弹出预览窗口
filetype plugin on "允许插件
set clipboard+=unnamed "共享剪贴板
set autowrite "自动保存
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set confirm " 在处理未保存或只读文件的时候，弹出确认
set history=1000 " 历史记录数
set nobackup "禁止生成临时文件
set noswapfile
set ignorecase "搜索忽略大小写
set hlsearch "搜索逐字符高亮
set incsearch
set gdefault "行内替换
filetype on " 侦测文件类型
filetype plugin on " 载入文件类型插件
filetype indent on " 为特定文件类型载入相关缩进文件
set viminfo+=! " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set linespace=0 " 字符间插入的像素行数目
set wildmenu " 增强模式中的命令行自动完成操作
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
set mouse=a
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离

set t_Co=256
set cc=120
colorscheme desert
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

""set foldmethod=indent
""set nofoldenable
""set list
""set listchars=tab:>-,trail:-

" ########### BASE-CONFIG END ###########

" ########### SHORTCUT BEGIN ###########
nnoremap <F3> <C-W>w
set pastetoggle=<F4>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <S-tab> :bn<CR>
nnoremap m ]c
nnoremap <S-m> [c
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ########### SHORTCUT END ###########

" ########### PLUGIN BEGIN ###########

" ########### indentLine BEGIN ###########
" indent guides  #######################################################################
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_tab_guides = 0
" ########### indentLine END ###########

" ########### airline BEGIN ###########
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
""let g:airline#extensions#tabline#show_splits = 1
""let g:airline#extensions#tabline#show_buffers = 1
""let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#branch#enabled = 1 " git enable

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

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
" ########### airline BEGIN ###########

" ########### cpp-enhanced BEGIN ###########
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" ########### cpp-enhanced END ###########


" ########### indentLine BEGIN ###########
let g:indentLine_enables = 1
""let g:indentLine_char="|"
" ########### indentLine END ###########

" ########### ale BEGIN ###########
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \   'csh': ['shell'],
            \   'zsh': ['shell'],
            \   'bash': ['shellcheck'],
            \   'go': ['golint', 'gofmt'],
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
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = "✗"
let g:ale_sign_error = ">>"
let g:ale_sign_warning = '⚡'
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
" ########### ale END ###########

" ########### tabnine BEGIN ###########
"set rtp+=~/.tabnine-vim/
" ########### tabnine END ###########

" ########### rainbow BEGIN ###########
let g:rainbow_active = 1
let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'css': 0,
            \	}
            \}

" ########### rainbow BEGIN ###########

" ########### COC BEGIN ###########
"" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
"" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Open file list
nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>

" ########### COC END ###########

" ########### lightline BEGIN ###########
set noshowmode " 不在底部显示命令or插入模式
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'cocstatus', 'gitbranch' ],
      \             [ 'happy' ]
      \             ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] 
      \             ]
      \ },
      \ 'component': {
      \   'happy': 'Be Happy☆',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"},
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"}
\ }

function! LightlineModified()
    return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
    return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
                \ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft ==# 'unite' ? unite#get_status_string() :
                \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
                \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
    if exists('*FugitiveHead')
        return FugitiveHead()
    endif
    return ''
endfunction
function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

let g:lightline#bufferline#show_number=2

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
" ########### lightline END ###########

" ########### nvim-treesitter BEGIN ###########
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },

  },

  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  }
}
EOF
" ########### nvim-treesitter END ###########

" ########### vim-easy-align BEGIN ###########
let g:easy_align_ignore_groups = ['Comment', 'String']
" ########### vim-easy-align END ###########

" ########### vim-floaterm BEGIN ###########
let g:floaterm_position='center'
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
" let g:floaterm_autoinsert=v:false

nnoremap <silent> <F7> :FloatermNew<cr>
nnoremap <silent> <F8> :FloatermToggle<cr>

tnoremap <silent> <F7> <c-\><c-n>:FloatermNew<cr>
tnoremap <silent> <F8> <c-\><c-n>:FloatermToggle<cr>

augroup floaterm_group
    autocmd!
    au FileType floaterm tnoremap <buffer> <silent> <M-h> <c-\><c-n>:FloatermPrev<CR>
    au FIleType floaterm tnoremap <buffer> <silent> <M-l> <c-\><c-n>:FloatermNext<CR>
augroup END
" Set floaterm window's background to black "guibg
" hi Floaterm ctermbg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder ctermbg=Yellow ctermfg=red
" ########### vim-floaterm END ###########

" ########### 修改补全框颜色 BEGIN ###########
highlight Pmenu ctermbg=darkgrey ctermfg=black
highlight PmenuSel ctermbg=lightgrey ctermfg=black
" ########### 修改补全框颜色 END ###########
