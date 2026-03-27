return {
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
        },
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    }
  }
