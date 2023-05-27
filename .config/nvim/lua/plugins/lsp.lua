return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x', -- requires Neovim v0.8 or greater.
    config = function()
      require('lsp-zero.settings').preset({})
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require('lsp-zero.cmp').extend()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action() 

      cmp.setup({
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  },

  {
    'glepnir/lspsaga.nvim',
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})

      local keymap = vim.keymap.set
      keymap("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
      keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
      keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
      keymap("n", "gn", "<cmd>Lspsaga rename<CR>")
      keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
      keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
  },
}
