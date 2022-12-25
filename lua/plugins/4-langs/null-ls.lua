local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.clang_format,
  formatting.black,
  formatting.stylua,
  diagnostics.flake8,
}

local format_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
null_ls.setup({
  border = "rounded",
  sources = sources,
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  --   end
  -- end,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
