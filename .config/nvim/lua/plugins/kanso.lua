vim.pack.add({
  'https://github.com/webhooked/kanso.nvim.git',
  version = main
})
require("kanso").setup({
  colors = {
    palette = {
      zenBg0 = "none"
    },
  },
  background = {
    dark = "zen",
  },
})
vim.cmd("colorscheme kanso")

