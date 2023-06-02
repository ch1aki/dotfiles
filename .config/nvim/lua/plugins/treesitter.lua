return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = { enable = true },
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        ensure_installed = {
          'bash',
          'css',
          'dockerfile',
          'go',
          'gomod',
          'graphql',
          'html',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'php',
          'python',
          'regex',
          'rust',
          'scss',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'yaml',
        }
      })
    end
  }
}
