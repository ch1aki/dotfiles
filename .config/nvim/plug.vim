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

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Test
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Syntax
Plug 'slim-template/vim-slim'
Plug 'rodjek/vim-puppet'

if has("nvim")
  " Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " Fuzzy Finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'windwp/nvim-autopairs'
endif

call plug#end()
