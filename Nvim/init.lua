-- Lazy bootstrap
require("config.lazy")

-- Vim settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Keybinds
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

-- LSP
vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
vim.lsp.enable({'bashls', 'clangd', 'pyright', 'rust_analyzer', 'lua_ls'})
vim.keymap.set('n', '<leader>d', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions)
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations)

-- Cmp
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
