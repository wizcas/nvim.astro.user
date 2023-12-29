-- TEMPLATE: https://github.com/AstroNvim/user_example/blob/main/options.lua

-- set vim options here (vim.<first_key>.<shttps://github.com/AstroNvim/user_example/blob/main/options.luaecond_key> = value)

local options = {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    textwidth = 120, -- the maximum column width of a single line
    timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    autoread = true, -- automatically reload changed files
    guifont = "CaskaydiaCove Nerd Font,FantasqueSansM Nerd Font,Fira Code Nerd Font,Fira Code NF:h16", -- fonts for GUI clients
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    copilot_no_tab_map = true, -- disable mapping Tab to accept GitHub Copilot suggestions
    copilot_filetypes = {
      markdown = true,
    },
  },
}

local guifont4nvy = "CaskaydiaCove Nerd Font:h16"

-- If you need more control, you can use the function()...end notation
return function(local_vim)
  for k1, v1 in pairs(options) do
    for k2, v2 in pairs(v1) do
      local_vim[k1][k2] = v2
    end
  end

  if vim.g.neovide then
    local neovide_opts = {
      neovide_floating_blur_amount_x = 4.0,
      neovide_floating_blur_amount_y = 4.0,
      neovide_remember_window_size = true,
      neovide_cursor_vfx_mode = "pixiedust",
      neovide_cursor_vfx_partical_density = 32.0,
      neovide_theme = "auto",
      neovide_fullscreen = true,
    }
    for k, v in pairs(neovide_opts) do
      vim.g[k] = v
    end
  end

  if vim.g.nvy then
    print "Hello, Nvy!"
    local_vim.opt.guifont = guifont4nvy
  end

  if vim.fn.has "win32" then
    local_vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
    local_vim.opt.shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    local_vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    local_vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    local_vim.opt.shellquote = ""
    local_vim.opt.shellxquote = ""
    local_vim.g.noshellslash = true
  end

  return local_vim
end
