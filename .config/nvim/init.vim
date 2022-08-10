" init autocmd
autocmd!

" 文字コード, 改行コード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

"set script encoding
scriptencoding utf-8

set nocompatible
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
au BufRead,BufNewFile *.slim set filetype=slim
au BufRead,BufNewFile *.pp set filetype=puppet

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

