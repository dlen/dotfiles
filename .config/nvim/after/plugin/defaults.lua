-- Move around easier through buffers
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Move around when in terminal mode
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')

-- Terminal on horizontal spit
vim.keymap.set('n', '<leader>T', ':sp +te<CR>')

-- Fugitive
vim.keymap.set('n', '<leader>g', ':G<CR>')

-- Open splits down and right
vim.o.splitbelow = true
vim.o.splitright = true

-- Automatic null ls setup
require("mason-null-ls").setup({
    automatic_setup = true,
})
