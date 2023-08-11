return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, config)
    local window = config.window

    -- the fuzzy finder works very slow and always crash when
    -- the number of files is too large. Thus I disable it.
    window.mappings["/"] = "noop"
    window.mappings["g/"] = "fuzzy_finder"
    window.mappings["b"] = "navigate_up"

    local filesystem = config.filesystem
    -- use fd for faster fuzzy finding
    filesystem.find_command = "fd"
    filesystem.find_args = {
      fd = {
        "--exclude",
        ".git",
        "--exclude",
        "node_modules",
      },
    }

    return config
  end,
}
