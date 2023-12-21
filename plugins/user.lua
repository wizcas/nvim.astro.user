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
  {
    "goerz/jupytext.vim",
    lazy = false,
    autoStart = true,
    init = function() vim.g.jupytext_fmt = "py:percent" end,
  },
  {
    "Vigemus/iron.nvim",
    lazy = false,
    autoStart = true,
    config = function()
      require("iron.core").setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" },
            },
            python = {
              command = { "ipython" },
              format = require("iron.fts.common").bracketed_paste,
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          -- repl_open_cmd = require("iron.view").bottom(40),
          repl_open_cmd = require("iron.view").split.vertical.botright "40%",
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<leader>rc",
          visual_send = "<leader>rc",
          send_file = "<leader>rf",
          send_line = "<leader>rl",
          send_until_cursor = "<leader>ru",
          send_mark = "<leader>rm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader>r<cr>",
          interrupt = "<leader>r<space>",
          exit = "<leader>rq",
          clear = "<leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }
    end,
  },
  {
    "GCBallesteros/vim-textobj-hydrogen",
    dependencies = { "kana/vim-textobj-user" },
    lazy = false,
    autoStart = true,
  },
}
