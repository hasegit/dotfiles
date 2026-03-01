-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- LSP Keymaps
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Lsp: Format document' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Lsp: Code Action' })

-- Oil
vim.keymap.set('n', '<leader>oi', require("oil").toggle_float, { desc = 'Open Oil (Float)' })

-- Picker Keymaps
local pick = require('mini.pick')
vim.keymap.set('n', '<leader>pf', [[<Cmd>Pick files tool='git'<CR>]], { desc = 'Pick files' })
vim.keymap.set('n', '<leader>pb', '<Cmd>Pick buffers<CR>', { desc = 'Pick buffers' })
vim.keymap.set('n', '<leader>pg', '<Cmd>Pick grep_live<CR>', { desc = 'Pick grep' })
vim.keymap.set('n', '<leader>pr',
  function() pick.builtin.files({}, { source = { name = 'Recent', items = vim.v.oldfiles } }) end,
  { desc = 'Pick Recent Files' })
