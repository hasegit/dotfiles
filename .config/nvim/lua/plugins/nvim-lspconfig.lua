vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
require("nvim-lspconfig").setup({})

-- Needs to install Language Servers
-- https://microsoft.github.io/language-server-protocol/implementors/servers/
