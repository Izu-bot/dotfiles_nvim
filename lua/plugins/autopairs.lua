return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },  -- desativa em certos buffers
        check_ts = true,  -- usa treesitter para contexto mais inteligente
      })
    end,
  },
}
