local on_attach = function(client, bufnr)

        local set = vim.keymap.set
        set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
        set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
        set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
        set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
        set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
        set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
        set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
        set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
        set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
