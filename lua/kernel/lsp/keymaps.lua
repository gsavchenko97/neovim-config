-- [[ LSP ]]
local M = {}

function M.set_keymaps(_, bufnr)
  local telescope_builtin = require("telescope.builtin")
  local func_search = function()
    telescope_builtin.lsp_document_symbols({ symbols = "function" })
  end
  local lsp_keymaps_tbl = {
    { "K", vim.lsp.buf.hover, "[K] Hover Documentation" },
    { "<C-d>", vim.lsp.buf.signature_help, "Signature Documentation" },
    { "gd", vim.lsp.buf.definition, "[G]oto [D]efinition" },
    { "gr", telescope_builtin.lsp_references, "[G]oto [R]eferences" },
    { "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation" },
    { "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration" },
    { "<leader>L", telescope_builtin.lsp_document_symbols, "Symbols [L]ist" },
    { "<leader>l", func_search, "Functions [L]ist" },
    { "<leader>r", vim.lsp.buf.rename, "[R]ename" },
    { "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition" },
    { "<leader>F", vim.lsp.buf.format, "[F]ormat Current Buffer" },
    { "<leader>v", vim.diagnostic.open_float, "[V]isualize diagnostic" },
    -- {'<leader>a', vim.lsp.buf.code_action, 'Code [A]ction'},
    -- nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- nmap('<leader>tr', '<cmd>Trouble lsp_references<cr>', buffer_options)
    -- nmap('<leader>tl', '<cmd>Trouble lsp_document_symbols<cr>', buffer_options)
    -- nmap('<leader>tw', '<cmd>Trouble workspace_diagnostics<cr>', buffer_options)
    -- nmap('<leader>td', '<cmd>Trouble document_diagnostics<cr>', buffer_options)
  }

  for _, mapping in ipairs(lsp_keymaps_tbl) do
    local keymap, cmd, desc = unpack(mapping)
    desc = "LSP: " .. desc
    vim.keymap.set("n", keymap, cmd, { silent = true, buffer = bufnr, noremap = true, desc = desc })
  end
end

return M
