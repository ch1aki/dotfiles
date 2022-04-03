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

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has("nvim")
  " Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " Fuzzy Finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'

  Plug 'windwp/nvim-autopairs'
endif

call plug#end()
