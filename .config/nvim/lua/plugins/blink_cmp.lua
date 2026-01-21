vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("*"),
  }
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ['<CR>'] = { 'accept', "fallback" },
  },
  appearance = {
    nerd_font_variant = 'normal',
  },
})
