-- [[ BASE ]]
local M = {}

local base_opts = require("kernel.base.options")
local base_km = require("kernel.base.keymaps")
local base_autocmds = require("kernel.base.autocmds")

function M.set_options()
  base_opts.set_options()
end

function M.set_keymaps()
  base_km.set_keymaps()
end

function M.set_autocmds()
  base_autocmds.set_autocmds()
end

return M
