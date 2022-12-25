local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-q>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-q>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("projects")
