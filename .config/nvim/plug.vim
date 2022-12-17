if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" Appearance
Plug 'itchyny/lightline.vim'
Plug 'tribela/vim-transparent'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

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
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Test
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Syntax
Plug 'slim-template/vim-slim'
Plug 'rodjek/vim-puppet'

if has("nvim")
  " Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'commit': '3b790e7657d6bb54245b5a70c2ae9355713d0b0c' }

  " Fuzzy Finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'windwp/nvim-autopairs'
endif

call plug#end()
