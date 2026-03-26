return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        config = function()
            local opts = {}
            opts.ensure_installed = {
                "c",
                "rust",
                "c_sharp",
                "bash"
            }
            opts.sync_install = true
            opts.highlight = { enable = true }
            opts.indent = { enable = true }
            require('nvim-treesitter.configs').setup(opts)
        end,
    }
}
