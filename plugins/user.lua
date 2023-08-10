local utils = require "astronvim.utils"

return {
  -- THEMES! YAY!
  {
    "oxfist/night-owl.nvim",
    name = "night-owl",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- Functional
  {
    "github/copilot.vim",
    lazy = false,
    autoStart = true,
    event = "InsertEnter",
  },
  -- for better markdown support
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "marksman") end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "prettier") end,
  },
  {
    "ruifm/gitlinker.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("gitlinker").setup() end,
  },
}
