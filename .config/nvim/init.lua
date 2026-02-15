-- Add plugins
vim.pack.add {
  -- LSP
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  -- Show Keymaps
  { src = 'https://github.com/folke/which-key.nvim.git',         version = 'main' },
  -- Parser Generator
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",  version = vim.version.range("main") },
  -- Completion
  { src = "https://github.com/saghen/blink.cmp",                 version = vim.version.range("*") },
  -- Autopair
  { src = 'https://github.com/nvim-mini/mini.pairs',             version = 'main' },
  -- Surrounding
  { src = 'https://github.com/nvim-mini/mini.surround',          version = 'main' },
  -- Show Indent
  { src = 'https://github.com/nvim-mini/mini.indentscope',       version = 'main' },
  -- ColorScheme
  { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim', version = 'main' }
}

-- Require
require("config")
require("plugin")

local plugins = {
  "mini_icons",
  "mini_ai",
  "snacks_nvim",
}
