return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      keymap(
        "i",
        "<C-g>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-j>", "<cmd>copilot-next<CR>")
      keymap("i", "<C-k>", "<cmd>copilot-previous<CR>")
      keymap("i", "<C-o>", "<cmd>copilot-dismiss<CR>")
      keymap("i", "<C-s>", "<cmd>copilot-suggest<CR>")
    end,
  },
}

