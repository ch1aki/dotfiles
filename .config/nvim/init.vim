" init autocmd
autocmd!
"set script encoding
scriptencoding utf-8

" 文字コード, 改行コード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

syntax enable
set nocompatible
set number
set noswapfile
set autoread
set ruler
set scrolloff=5
set backspace=indent,eol,start
set visualbell t_bl=
set noerrorbells
set mouse=a
set wrapscan
set hlsearch
set nobackup
set expandtab
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" File type
au BufRead,BufNewFile *.rb,*.jb,*.rbi,Capfile,*.cap set filetype=ruby
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.py set filetype=python
au BufNewFile,BufRead *.md set filetype=markdown

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif

" For NeoVim
if has('nvim')
  " change cursor in defferent modes
  let g:deoplete#enable_at_startup = 1
  " for Mac
  if has('mac')
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif

  " Do WSL stuff
  if system('uname -a | grep microsoft') != ''
    runtime ./wsl.vim
  endif
endif

runtime ./maps.vim
"}}}

" colorscheme
let g:tokyonight_style = "night"
colorscheme tokyonight

" vim-go
"" dsable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
""""""
" coc
""""""
" TextEdit might fail if hidden is not set.
set hidden

"" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
" Give more space for displaying messages.
set cmdheight=2

"" run go imports on file save
let g:go_fmt_command = "goimports"
" default is 4000 ms
set updatetime=300

"" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn
set signcolumn=yes

