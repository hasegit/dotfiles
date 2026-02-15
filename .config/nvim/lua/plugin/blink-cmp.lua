require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ['<CR>'] = { 'accept', "fallback" },
  },
  appearance = {
    nerd_font_variant = 'normal',
  },
})
