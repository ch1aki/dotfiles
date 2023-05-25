-- init autocmd
vim.cmd('autocmd!')

-- char code
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,iso-2022-jp,cp932,sjis,euc-jp'
vim.opt.fileformats = 'unix,dos,mac'

vim.opt.autoread = true
vim.opt.ruler = true
vim.opt.scrolloff=5
vim.opt.visualbell=false
vim.opt.wrapscan=true
vim.opt.expandtab=true
vim.opt.termguicolors = true

-- search
vim.opt.inccommand = 'split'
vim.opt.hlsearch=true

vim.opt.backspace='indent,eol,start'
vim.opt.mouse='a'

vim.opt.backupskip='/tmp/*,/private/tmp/*'

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
