-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- opt
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- share clipboard with OS
opt.clipboard:append("unnamedplus,unnamed")

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.scrolloff = 3

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

opt.signcolumn = "yes" -- Prevent layout shift by always showing sign column

