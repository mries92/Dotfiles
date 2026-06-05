-- Vim settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Keybinds
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})

-- Lazy
require("config.lazy")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "cpp" },
  highlight = {
    enable = true,
  }
}

-- LSP
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

-- Cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config['bashls'] = { capabilities = capabiliites }
vim.lsp.config['clangd'] = { capabilities = capabiliites }
vim.lsp.config['pyright'] = { capabilities = capabiliites }
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item()
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }
})
