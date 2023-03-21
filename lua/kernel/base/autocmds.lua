-- [[ BASE.AUTOCMDS ]]
local M = {}

local log = require("kernel.log")

local prepare_pattern = function(projectList)
  local pattern = ""
  local prefix = "/home/gsav/repos/"
  local sep = ""
  local suffix = "/*"
  for _, project in ipairs(projectList) do
    pattern = pattern .. sep .. prefix .. project .. suffix
    sep = ","
  end
  return pattern
end
local projectList = { "ozon", "shad/cpp1" }
local pattern = prepare_pattern(projectList)

local set_indentation_autocmd = function()
  local tabs = vim.api.nvim_create_augroup("MyTabs", { clear = true })
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      log.print("Pattern:" .. pattern)
      local tab_width = 4
      vim.opt.shiftwidth = tab_width
      vim.opt.tabstop = tab_width
      vim.opt.softtabstop = tab_width
    end,
    group = tabs,
    pattern = pattern .. ",*.go",
  })
end

local set_hightlight_autocmd = function()
  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
  })
end

local set_helper_autocmd = function()
  local my_group = vim.api.nvim_create_augroup("MyPersonal", { clear = true })
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      log.print("AutoCmd")
      log.print("Pattern:" .. pattern)
      log.print("Field:" .. vim.fn.expand("<sfile>") .. "$")
      log.print("Field:" .. vim.fn.expand("<afile>") .. "$")
    end,
    group = my_group,
    pattern = "/home/gsav/repos/ozon/*,/home/gsav/repos/shad/*",
  })
end

function M.set_autocmds()
  set_hightlight_autocmd()
  set_indentation_autocmd()
  -- set_helper_autocmd()
end

return M
