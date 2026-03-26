return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    position = "left",
                    width = 30,
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    hide_dotfiles = false,
                },
            })

            -- Atalhos para abrir/fechar
            vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>',  { noremap = true, silent = true })
            
        end
    }
}
