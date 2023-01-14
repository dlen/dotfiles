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
vim.keymap.set('n', '<leader>G', ':G<CR>')

-- Open splits down and right
vim.o.splitbelow = true
vim.o.splitright = true

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.diagnostics.hadolint,
        require("null-ls").builtins.diagnostics.psalm,
        require("null-ls").builtins.diagnostics.rubocop,
        require("null-ls").builtins.diagnostics.yamllint,
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.diagnostics.golangci_lint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.code_actions.shellcheck,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.jq,
        require("null-ls").builtins.formatting.nginx_beautifier,
        require("null-ls").builtins.formatting.packer,
        require("null-ls").builtins.formatting.shellharden,
        require("null-ls").builtins.formatting.gofumpt,
        require("null-ls").builtins.formatting.goimports,
    }
})

-- Automatic mason null ls setup
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})

require 'mason-null-ls'.setup_handlers()

require('nvim-test').setup()

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require('go').setup()
