vim.pack.add({
  'https://github.com/folke/which-key.nvim.git',
  version = main
})
require("which-key").setup({
  preset = "helix"
})
