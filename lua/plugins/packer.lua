-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = true
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer can't be loaded.")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  -- Plugin manager (should go first)
  use("wbthomason/packer.nvim")

  -- [[ CORE ]]
  local setup_core_plugins = function()
    -- Speedup neovim start
    use("lewis6991/impatient.nvim")
  end
  setup_core_plugins()

  -- [[ COLORSCHEME ]]
  local setup_colorscheme = function()
    -- Themes
    use("marko-cerovac/material.nvim")
    use("navarasu/onedark.nvim")
    -- use 'EdenEast/nightfox.nvim'
    -- use 'rose-pine/neovim'
    -- use 'tiagovla/tokyodark.nvim'
    -- use 'folke/tokyonight.nvim'
    -- use 'Mofiqul/vscode.nvim'
    -- use 'sainnhe/everforest'
    -- use 'rebelot/kanagawa.nvim'
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'projekt0n/github-nvim-theme'
  end
  setup_colorscheme()

  -- [[ EDITOR ]]
  local setup_editor_related_plugins = function()
    -- Convenient way of commenting
    use("numToStr/Comment.nvim")
    -- Autopairs
    use("windwp/nvim-autopairs")
    -- Show indents
    use("lukas-reineke/indent-blankline.nvim")
    -- -- Automatically detect indent size
    -- use 'tpope/vim-sleuth'
    -- -- Rainbow for paranthes
    -- use 'p00f/nvim-ts-rainbow'
  end
  setup_editor_related_plugins()

  -- [[ IDE ]]
  local setup_ide_like_features = function()
    -- Beauty notifications
    use("rcarriga/nvim-notify")
    -- NvimTree (files navigator)
    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
    })
    -- Trouble (alternative for quickfix)
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })
    -- Telescope (search/finder plugin)
    -- depends on Trouble plugins, so should be initialized later
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    })
    -- Symbols outline
    use("simrat39/symbols-outline.nvim")
    -- Lualine (status line themes)
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    -- Bufferline (buffers themes)
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
    -- Cenetering buffer
    use({ "shortcuts/no-neck-pain.nvim", tag = "*" })
    -- Projects
    use("ahmedkhalf/project.nvim")
    -- -- Git decorations
    -- use("lewis6991/gitsigns.nvim")
    -- -- Toggle term
    -- use { "akinsho/toggleterm.nvim", tag = '*' }
    -- -- Keymappings list
    -- use "folke/which-key.nvim"
    -- -- Alpha (start screen)
    -- use 'goolord/alpha-nvim'
  end
  setup_ide_like_features()

  -- [[ LANGS ]]
  local setup_languages_support = function()
    -- Neovim plugins development support
    use("folke/neodev.nvim")
    -- Non-LSP languages support
    use("jose-elias-alvarez/null-ls.nvim")
    -- LSP
    use({
      "neovim/nvim-lspconfig",
      requires = {
        -- Package manager (especially useful for LSP)
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Lsp progress bar
        "j-hui/fidget.nvim",
        -- Hints with functions signature
        "ray-x/lsp_signature.nvim",
      },
    })
    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
    })
    -- Syntax highlighting
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })
    use({ -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    })
  end
  setup_languages_support()

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "packer.lua",
})
