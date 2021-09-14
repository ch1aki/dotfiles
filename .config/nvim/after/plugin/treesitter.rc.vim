if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "hcl",
    "python",
    "ruby",
    "vim",
    "go"
  },
}
EOF
