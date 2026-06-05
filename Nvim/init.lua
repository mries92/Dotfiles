require("config.lazy")

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

local builtin = require('telescope.builtin')

-- Keybinds
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "cpp" },
  highlight = {
    enable = true,
  }
}

vim.lsp.enable('clangd')
