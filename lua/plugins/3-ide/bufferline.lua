require("bufferline").setup({
  options = {
    -- indicator = {
    --   style = 'underline',
    -- },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, _, _, _)
      return "(" .. count .. ")"
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true, -- use a "true" to enable the default, or set your own character
      },
    },
  },
})
