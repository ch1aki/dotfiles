if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" Appearance
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

" Git
Plug 'Toruiwashita/git-switcher.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'iberianpig/tig-explorer.vim'

" Filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'


if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
endif

call plug#end()
