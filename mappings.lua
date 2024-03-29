-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>be"] = { "<cmd>e!<cr>", desc = "Revert buffer changes" },
    ["<leader>bh"] = { "<cmd>CDHere<cr>", desc = "CD to the buffer's directory" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- LSPs
    ["<leader>lz"] = {
      function()
        vim.lsp.codelens.clear()
        if vim.g.codelens_enabled then vim.lsp.codelens.refresh() end
      end,
      desc = "Reload CodeLens",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>a"] = {
      function()
        local wins = vim.api.nvim_tabpage_list_wins(0)
        if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
          vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
        end
        require("alpha").start(false, require("alpha").default_config)
      end,
      desc = "Home screen",
    },
    ["<leader>h"] = { ":noh<cr>", desc = "noh" },
    ["<leader>\\"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["<leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    -- Database
    ["<leader>so"] = { "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
    ["<leader>s"] = { name = "Database" },
    -- IronREPL
    ["<leader>r"] = { name = "IronREPL" },
    ["<leader>rs"] = { "<cmd>IronRepl<cr>", desc = "Open Iron REPL" },
    ["<leader>rr"] = { "<cmd>IronRestart<cr>", desc = "Restart Iron REPL" },
    ["<leader>rf"] = { "<cmd>IronFocus<cr>", desc = "Focus Iron REPL" },
    ["<leader>rh"] = { "<cmd>IronHide<cr>", desc = "Hide Iron REPL" },
    ["<leader>rp"] = { "<cmd>normal 1 rcih<cr>/^# %%<cr>", desc = "Send Python cell go to next" },
  },
  i = {
    ["<leader>,"] = {
      'copilot#Accept("")',
      desc = "Copilot accept",
      expr = true,
      silent = true,
      noremap = true,
      replace_keycodes = false,
    },
    ["<leader>，"] = {
      'copilot#Accept("")',
      desc = "Copilot accept",
      expr = true,
      silent = true,
      noremap = true,
      replace_keycodes = false,
    },
  },
  v = {
    p = { '"_dP', desc = "Paste without yanking" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
