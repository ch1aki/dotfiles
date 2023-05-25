local nmap = require('util.helper').nmap

return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup{
        theme = 'tokyonight'
      }
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    enable = true,
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim"
    },
    cmd = 'Telescope',
    init = function()
      nmap(';f', '<CMD>Telescope find_files<CR>')
      nmap(';g', '<CMD>Telescope live_grep<CR>')
      nmap(';t', '<CMD>Telescope help_tags<CR>')
      nmap('sf', function()
        return '<CMD>Telescope file_browser cwd=' .. vim.fn.expand('%:p:h') .. '<CR>'
      end, { silent = true, expr = true })
    end,
    config = function()
      local telescope = require('telescope')
      local fb_actions = require('telescope._extensions.file_browser.actions')

      telescope.setup({
        file_ignore_patterns = { '^.git/' },
        extensions = {
          file_browser = {
            theme = "dropdown",
            initial_mode = 'normal',
            hidden = true,
            respect_gitignore = false,
            --hijack_netrw = true,
            mappings = {
              -- your custom insert mode mappings
              ["i"] = {
                ["<C-w>"] = function() vim.cmd('normal vbd') end,
              },
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd('startinsert')
                end
              },
            },
          },
        }
      })

      telescope.load_extension('file_browser')
    end

  },
}
