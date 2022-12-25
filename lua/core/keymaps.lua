local keymaps = {}

local basic_keymaps_tbl = {
  n = {
    -- Window navigation
    { "<C-j>", "<C-w>j", "Go to bottom window" },
    { "<C-k>", "<C-w>k", "Go to top window" },
    { "<C-h>", "<C-w>h", "Go to left window" },
    { "<C-l>", "<C-w>l", "Go to right window" },
    -- Resize windows
    { "<C-Up>", "<cmd>resize +2<cr>", "Resize window up" },
    { "<C-Down>", "<cmd>resize -2<cr>", "Resize window down" },
    { "<C-Right>", "<cmd>vertical resize +2<cr>", "Resize window right" },
    { "<C-Left>", "<cmd>vertical resize -2<cr>", "Resize window left" },
    -- Buffers
    { "<leader>s", "<cmd>wa<cr>", "[S]ave all buffers" },
    { "<leader>ы", "<cmd>wa<cr>", "[S]ave all buffers (ru)" },
    { "<leader>q", "<cmd>qa<cr>", "[Q]uit all buffers" },
    { "<leader>й", "<cmd>qa<cr>", "[Q]uit all buffers (ru)" },
    { "<leader>w", "<cmd>bd<cr>", "Close current buffer" },
    { "<leader>ц", "<cmd>bd<cr>", "Close current buffer (ru)" },
    { "<S-h>", "<cmd>bprevious<cr>", "Previous buffer" },
    { "<S-l>", "<cmd>bnext<cr>", "Next buffer" },
  },
  v = {
    -- Move lines
    { "<", "<gv", "Move line left" },
    { ">", ">gv", "Move line right" },
    -- Paste don't reset buffer
    { "p", '"_dP', "Better paste" },
  },
}

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

local telescope_projects = require("telescope").extensions.projects.projects
local plugins_keymaps_tbl = {
  -- [[ NvimTree ]]
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", "File [E]xplorer" },
  { "<leader>у", "<cmd>NvimTreeToggle<cr>", "File [E]xplorer (ru)" },
  -- [[ Trouble ]]
  { "<leader>c", "<cmd>TroubleToggle<cr>", "[C]lose Trouble" },
  { "<leader>с", "<cmd>TroubleToggle<cr>", "[C]lose Trouble (ru)" },
  -- [[ SymbolsOutline ]]
  { "<leader>O", "<cmd>SymbolsOutline<cr>", "Symbols [O]utline" },
  { "<leader>Щ", "<cmd>SymbolsOutline<cr>", "Symbols [O]utline (ru)" },
  -- [[ Telescope ]]
  { "<leader>t", telescope_builtin.resume, "[T]elescope Resume" },
  { "<leader>е", telescope_builtin.resume, "[T]elescope Resume (ru)" },
  { "<leader>b", telescope_builtin.buffers, "Find Existing [B]uffers" },
  { "<leader>и", telescope_builtin.buffers, "Find Existing [B]uffers (ru)" },
  { "<leader>p", telescope_builtin.find_files, "[p] Find Files" },
  { "<leader>з", telescope_builtin.find_files, "[p] Find Files (ru)" },
  { "<leader>o", telescope_builtin.oldfiles, "[O]ld Files" },
  { "<leader>щ", telescope_builtin.oldfiles, "[O]ld Files (ru)" },
  { "<leader>f", telescope_builtin.current_buffer_fuzzy_find, "[F]ind In Current Buffer" },
  { "<leader>а", telescope_builtin.current_buffer_fuzzy_find, "[F]ind In Current Buffer (ru)" },
  { "<leader>g", telescope_builtin.live_grep, "Live [G]rep" },
  { "<leader>п", telescope_builtin.live_grep, "Live [G]rep (ru)" },
  { "<leader>G", telescope_builtin.grep_string, "[G]rep Current Word" },
  { "<leader>П", telescope_builtin.grep_string, "[G]rep Current Word (ru)" },
  { "<leader>d", telescope_builtin.diagnostics, "[D]iagnostics" },
  { "<leader>в", telescope_builtin.diagnostics, "[D]iagnostics (ru)" },
  { "<leader>h", telescope_builtin.help_tags, "Search [H]elp" },
  { "<leader>р", telescope_builtin.help_tags, "Search [H]elp (ru)" },
  { "<leader>P", telescope_projects, "[P]rojects" },
  { "<leader>З", telescope_projects, "[P]rojects (ru)" },
  -- [[ NoNeckPain ]]
  { "<leader>m", "<cmd>NoNeckPain<cr>", "[M]iddle Buffer" },
  { "<leader>ь", "<cmd>NoNeckPain<cr>", "[M]iddle Buffer (ru)" },
}

function keymaps.basic_keymaps()
  for mode, mappings in pairs(basic_keymaps_tbl) do
    for _, mapping in ipairs(mappings) do
      local keymap, cmd, desc = unpack(mapping)
      vim.keymap.set(mode, keymap, cmd, { noremap = true, silent = true, desc = desc })
    end
  end

  -- Remap for dealing with word wrap
  vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })
  vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })

  -- Unmap space for leader
  vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, noremap = true })
end

function keymaps.lsp_keymaps(_, bufnr)
  for _, mapping in ipairs(lsp_keymaps_tbl) do
    local keymap, cmd, desc = unpack(mapping)
    desc = "LSP: " .. desc
    vim.keymap.set("n", keymap, cmd, { silent = true, buffer = bufnr, noremap = true, desc = desc })
  end
end

function keymaps.plugins_keymaps()
  for _, mapping in ipairs(plugins_keymaps_tbl) do
    local keymap, cmd, desc = unpack(mapping)
    vim.keymap.set("n", keymap, cmd, { noremap = true, silent = true, desc = desc })
  end
end

return keymaps
