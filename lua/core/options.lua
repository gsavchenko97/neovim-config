-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentations
local tab_width = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = tab_width
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line appearance
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.cursorline = true
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Buffer
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Left columns
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Russian lang configurations
vim.opt.langmap =
"БЮЖФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;\\<>:ABCDEFGHIJKLMNOPQRSTUVWXYZ,бюжфисвуапршолдьтщзйкыегмцчня;\\,.;abcdefghijklmnopqrstuvwxyz"

-- Misc
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.laststatus = 3
vim.opt.termguicolors = true -- Needed for bufferline plugin
