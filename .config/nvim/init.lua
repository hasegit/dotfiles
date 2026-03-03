-- Add plugins
vim.pack.add {
  -- LSP
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  -- Show Keymaps
  { src = 'https://github.com/folke/which-key.nvim.git',        version = 'main' },
  -- Parser Generator
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = vim.version.range("main") },
  -- Completion
  { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("*") },
  -- Nerd Font icon util
  { src = 'https://github.com/nvim-tree/nvim-web-devicons.git', version = 'master' },
  -- Autopair
  { src = 'https://github.com/nvim-mini/mini.pairs',            version = 'main' },
  -- Extend a/i
  { src = 'https://github.com/nvim-mini/mini.ai.git',           version = 'main' },
  -- Surrounding
  { src = 'https://github.com/nvim-mini/mini.surround',         version = 'main' },
  -- Show Indent
  { src = 'https://github.com/nvim-mini/mini.indentscope',      version = 'main' },
  -- Picker
  { src = 'https://github.com/nvim-mini/mini.pick',             version = 'main' },
  -- Animation
  { src = 'https://github.com/sphamba/smear-cursor.nvim',       version = 'main' },
  -- Noice dependency
  { src = 'https://github.com/MunifTanjim/nui.nvim',            version = 'main' },
  -- Enhanced messages, cmdline and popupmenu
  { src = 'https://github.com/folke/noice.nvim',                version = 'main' },
  -- File Explorer
  { src = 'https://github.com/stevearc/oil.nvim',               version = 'master' },
  -- Copilot
  { src = 'https://github.com/zbirenbaum/copilot.lua',          version = 'master' }
}

-- Require
require("config")
require("plugin")

vim.opt.cmdheight = 0
