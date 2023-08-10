return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, config)
    local window = config.window

    -- the fuzzy finder works very slow and always crash when
    -- the number of files is too large. Thus I disable it.
    window.mappings["/"] = "noop"
    window.mappings["g/"] = "fuzzy_finder"

    -- show the hidden files but with different visual style
    window.filesystem = {
      filtered_items = {
        visible = true,
      },
    }

    return config
  end,
}
