-- [[ CONFIG ]]
local M = {}

local base = require("kernel.base")
local plugin = require("kernel.plugin")

function M.init_config()
  base.set_options()
  base.set_keymaps()
  base.set_autocmds()

  plugin.init()
end

return M
