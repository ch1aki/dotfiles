" 文字コード, 改行コード
set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" Key mapping
imap <C-[> <esc>

" dein settings
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let s:toml_dir  = $HOME . '/.config/dein/toml'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" Color
syntax enable
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" 基本設定
set noswapfile
set autoread    " 他でファイルが表示されたとき自動で読み込む
set ruler       " カーソルが何行目の何列目に置かれているかを表示する
set scrolloff=5
set backspace=indent,eol,start
set clipboard&
set clipboard^=unnamedplus
set visualbell t_bl=
set noerrorbells
set mouse=a

" File type
au BufRead,BufNewFile *.rb,*.jb,*.rbi  set filetype=ruby
au BufRead,BufNewFile *.go             set filetype=go
au BufRead,BufNewFile *.py             set filetype=python

" Configuration binary
augroup Binary
  au!
  au BufReadPre  *.bin let &binary =1
  au BufReadPost * if &binary | silent %!xxd -g 1
  au BufReadPost * set ft=xxd | endif
  au BufWritePre * if &binary | %!xxd -r | endif
  au BufWritePost * if &binary | silent %!xxd -g 1
  au BufWritePost * set nomod | endif
  au!
augroup END

" 検索設定
set wrapscan
set hlsearch
nnoremap <C-]> g<C-]> 

" lightline.vim 設定諸々
" https://github.com/itchyny/lightline.vim
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

" NERDTree
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" terminal mode
tnoremap <ESC> <C-\><C-n>

" fzf
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" ale
" let g:ale_linters = {
"\   'javascript': ['eslint'],
"\}
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

