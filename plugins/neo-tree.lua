return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, config)
    local mappings = config.window.mappings
    -- the fuzzy finder works very slow and always crash when
    -- the number of files is too large. Thus I disable it.
    mappings["/"] = ""
    return config
  end,
}
