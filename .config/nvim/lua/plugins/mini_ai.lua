--[[
⏺ mini.ai is a plugin from mini.nvim that extends Neovim's text objects (i and a in visual/operator-pending mode).

  What it does

  Adds more text objects for selecting/operating on code:
  ┌─────────────┬────────────────────────────────────┐
  │ Text Object │            Description             │
  ├─────────────┼────────────────────────────────────┤
  │ iq / aq     │ Quotes (auto-detects ', ", `)      │
  ├─────────────┼────────────────────────────────────┤
  │ ib / ab     │ Brackets (auto-detects (), [], {}) │
  ├─────────────┼────────────────────────────────────┤
  │ if / af     │ Function call                      │
  ├─────────────┼────────────────────────────────────┤
  │ ia / aa     │ Argument                           │
  ├─────────────┼────────────────────────────────────┤
  │ it / at     │ HTML/XML tag                       │
  └─────────────┴────────────────────────────────────┘
  Examples

  local example = function(arg1, arg2)
    return "hello world"
  end
  ┌───────────┬─────────┬──────────────────────────────────┐
  │ Cursor on │ Command │             Selects              │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ hello     │ viq     │ hello world (inside quotes)      │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ hello     │ vaq     │ "hello world" (around quotes)    │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ arg1      │ via     │ arg1 (inside argument)           │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ arg1      │ daa     │ deletes arg1,  (around argument) │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ function  │ vaf     │ function(arg1, arg2)             │
  ├───────────┼─────────┼──────────────────────────────────┤
  │ arg2      │ cia     │ change inside argument           │
  └───────────┴─────────┴──────────────────────────────────┘
  Key benefit

  Works with d, c, y, v operators:
  - daa - delete an argument
  - ciq - change inside quotes
  - yaf - yank a function call

  Modifiers (n = next, l = last)

  Use "n" or "l" to target next/previous text object:
  - cin{ - change inside next {}
  - cil{ - change inside last (previous) {}
  - dan( - delete around next ()
  - vil" - select inside last ""
]]
vim.pack.add({
  'https://github.com/nvim-mini/mini.ai',
  version = main
})
require("mini.ai").setup()
