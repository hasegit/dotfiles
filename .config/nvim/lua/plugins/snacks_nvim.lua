vim.pack.add({
  'https://github.com/folke/snacks.nvim.git',
  version = main
})

local snacks = require("snacks")

snacks.setup({
  animate = {
    fps = 120,
  },
  indent = {
    enabled = true,
    animate = {
      duration = { step = 20, total = 200 },
    },
  },
  picker = { enabled = true },
  scroll = {
    enabled = true,
    animate = {
      duration = { step = 10, total = 100 },
      easing = "outQuint",
    },
    animate_repeat = {
      delay = 50,
      duration = { step = 3, total = 20 },
      easing = "outQuint",
    },
  },
})

-- Picker keymaps
vim.keymap.set("n", "<leader>pf", function() snacks.picker.files() end, { desc = "Picker - Find files" })
vim.keymap.set("n", "<leader>pg", function() snacks.picker.grep() end, { desc = "Picker - live Grep" })
vim.keymap.set("n", "<leader>pb", function() snacks.picker.buffers() end, { desc = "Picker - Buffers" })
vim.keymap.set("n", "<leader>pr", function() snacks.picker.recent() end, { desc = "Picker - Recent files" })
vim.keymap.set("n", "<leader>ph", function() snacks.picker.help() end, { desc = "Picker - Help tags" })
