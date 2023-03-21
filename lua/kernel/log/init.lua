-- [[ KERNEL.LOG ]]
local M = {}

function M.print(msg)
  local log_file = "/home/gsav/.config/nvim/logs/debug_log"
  local file = io.open(log_file, "a")
  local log_str = string.format("%s: %s\n", os.date(), msg)
  file:write(log_str)
  file:close()
end

return M
