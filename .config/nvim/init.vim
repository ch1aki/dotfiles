" init autocmd
autocmd!
" set script encoding
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
au BufRead,BufNewFile *.rb,*.jb,*.rbi  set filetype=ruby
au BufRead,BufNewFile *.go             set filetype=go
au BufRead,BufNewFile *.py             set filetype=python
au BufNewFile,BufRead *.md set filetype=markdown

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'tokyonight',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'fugitive#head',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode',
        \   'ale': 'ALEGetStatusLine'
        \ }
        \}

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" For NeoVim
if has('nvim')
  " change cursor in defferent modes
  let g:deoplete#enable_at_startup = 1
  " for Mac
  if has('mac')
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

" fzf
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use tokyonight
  let g:tokyonight_style = "night"
  let g:tokyonight_transparent = "true"
  colorscheme tokyonight
endif
