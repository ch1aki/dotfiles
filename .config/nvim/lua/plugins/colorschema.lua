return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
      --vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })      
      require("tokyonight").setup({
        style = "night",
        trasparent = true,
      })
    end,
  }
}
