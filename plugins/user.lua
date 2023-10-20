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
  {
    "sainnhe/edge",
    name = "edge",
    priority = 1000,
    config = function()
      vim.g.edge_style = "neon"
      vim.g.edge_better_performance = 1
    end,
  },
  {
    "sainnhe/sonokai",
    name = "sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_style = "maia"
      vim.g.sonokai_better_performance = 1
    end,
  },
  -- Functional
  {
    "github/copilot.vim",
    lazy = false,
    autoStart = true,
    event = "InsertEnter",
  },
  {
    "ruifm/gitlinker.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("gitlinker").setup() end,
  },

  -- DB
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
