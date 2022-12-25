-- [[ CORE ]]
require("core.options")
require("core.autocmds")
require("core.keymaps").basic_keymaps()

-- [[ PLUGINS ]]
-- Plugin manager (should be in the beginning)
require("plugins.packer")
-- 0) Core
require("plugins.0-core.impatient")
-- 1) Colorscheme
require("plugins.1-colorscheme.material")
-- require('plugins.1-colorscheme.onedark')
-- 2) Editor
require("plugins.2-editor.comment")
require("plugins.2-editor.nvim-autopairs")
require("plugins.2-editor.indent-blankline")
-- 3) IDE
require("plugins.3-ide.nvim-notify")
require("plugins.3-ide.nvim-tree")
require("plugins.3-ide.trouble")
require("plugins.3-ide.telescope")
require("plugins.3-ide.symbols-outline")
require("plugins.3-ide.lualine")
require("plugins.3-ide.bufferline")
require("plugins.3-ide.no-neck-pain")
-- require("plugins.3-ide.gitsigns")
-- require('plugins.3-ide.toggleterm')
-- require('plugins.3-ide.which-key')
-- require('plugins.3-ide.alpha-nvim')
-- 4) Langs
require("plugins.4-langs.neodev")
require("plugins.4-langs.null-ls")
require("plugins.4-langs.lsp")
require("plugins.4-langs.fidget")
require("plugins.4-langs.lsp_signature")
require("plugins.4-langs.nvim-cmp")
require("plugins.4-langs.nvim-treesitter")

require("plugins.3-ide.project")
-- Plugin mappings (should be in the end)
require("core.keymaps").plugins_keymaps()
