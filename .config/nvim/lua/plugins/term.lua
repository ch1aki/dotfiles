return {
        {
                "akinsho/toggleterm.nvim",
                config = function()
                        local Terminal = require('toggleterm.terminal').Terminal

                        -- normal
                        local shell = Terminal:new({
                                hidden = true,
                                direction = "float",
                        })

                        function _shell_toggle()
                                shell:toggle()
                        end 
                        vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>lua _shell_toggle()<CR>")

                        -- lazygit
                        local lazygit = Terminal:new({
                                cmd = "lazygit",
                                hidden = true,
                                direction = "float",
                        })

                        function _lazygit_toggle()
                                lazygit:toggle()
                        end 
                        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

                end
        },
}
