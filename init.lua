return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "night-owl",
  colorscheme = "catppuccin",
  -- colorscheme = "edge",
  -- colorscheme = "sonokai",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
        "tsserver",
      },
      timeout_ms = 3000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.filetype.add {
      extension = {
        mdx = "markdown",
      },
    }

    -- user commands
    vim.api.nvim_create_user_command(
      "CDHere",
      "cd %:p:h",
      { nargs = 0, desc = "Change pwd to the current buffer's directory" }
    )
    -- lsp configs
    local ok, lspconfig = pcall(require, "lspconfig")
    if ok then
      local configPath = vim.fn.stdpath "config"
      lspconfig.powershell_es.setup {
        bundle_path = configPath .. "/lspinstall/powershell_es",
      }
    end

    -- auto disable IME in neovide
    local function set_ime(args)
      if args.event:match "Enter$" then
        vim.g.neovide_input_ime = true
      else
        vim.g.neovide_input_ime = false
      end
    end
    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
      group = ime_input,
      pattern = "*",
      callback = set_ime,
    })
    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
      group = ime_input,
      pattern = "[/\\?]",
      callback = set_ime,
    })

    -- set omnisharp for c#
    local omnisharp_path = require("mason-core.path").concat {
      vim.fn.stdpath "data",
      "mason",
      -- "bin",
      -- "omnisharp",
      "packages",
      "omnisharp",
      "libexec",
      "OmniSharp.dll",
    }
    require("lspconfig").omnisharp.setup {
      cmd = { "dotnet", omnisharp_path },
      -- cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
      },

      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      enable_editorconfig_support = true,

      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      enable_ms_build_load_projects_on_demand = false,

      -- Enables support for roslyn analyzers, code fixes and rulesets.
      enable_roslyn_analyzers = true,

      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      organize_imports_on_format = true,

      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      enable_import_completion = true,

      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      sdk_include_prereleases = true,

      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      analyze_open_documents_only = false,
    }
  end,
}
