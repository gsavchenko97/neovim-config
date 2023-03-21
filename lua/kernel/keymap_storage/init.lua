-- [[ KEYMAP_STORAGE ]]
local M = {}

M.KeymapStorage = {}

function M.KeymapStorage:new()
  newObj = {keymaps = {"None"}}
  self.__index = self
  return setmetatable(newObj, self)
end

function M.KeymapStorage:add(keymap)
  table.insert(self.keymaps, keymap)
end

return M
