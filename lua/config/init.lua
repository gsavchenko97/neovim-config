-- [[ CONFIG ]]
local M = {}

local log = require("kernel.log")
local base = require("kernel.base")
local plugin = require("kernel.plugin")
-- local keymap_storage = require("kernel.keymap_storage")

function M.init_config()
  log.print("config.initialization: start config initialization")

  --[[
  local kmStorage = keymap_storage.KeymapStorage:new()
  kmStorage:add("Yep")
  kmStorage:add("Nope")
  log.print(string.format("KeymapStorage len=%d", #kmStorage.keymaps))
  --]]
  base.set_options()
  base.set_keymaps()
  base.set_autocmds()

  plugin.init()

  log.print("config.initialization: config initialized")
end

return M
