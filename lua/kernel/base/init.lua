-- [[ BASE ]]
local M = {}

local log = require("kernel.log")
local base_opts = require("kernel.base.options")
local base_km = require("kernel.base.keymaps")
local base_autocmds = require("kernel.base.autocmds")

function M.set_options()
  base_opts.set_options()
  log.print("kernel.base: options set")
end

function M.set_keymaps()
  base_km.set_keymaps()
  log.print("kernel.base: keymaps set")
end

function M.set_autocmds()
  base_autocmds.set_autocmds()
  log.print("kernel.base: autocommands set")
end

return M
