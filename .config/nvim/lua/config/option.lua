-- linenumber
vim.opt.number = true
vim.opt.relativenumber = true

-- cursor
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- cursorline
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "NONE",
  sp = "#ffffff",
  underline = true,
  ctermbg = "NONE",
})

-- StatusLine
vim.opt.laststatus = 0

-- Bottom
vim.opt.showcmd = false
vim.opt.ruler = false

-- Behavior
vim.opt.clipboard:append("unnamedplus,unnamed") -- share clipboard with OS
vim.opt.mouse = "a"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.scrolloff = 3

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual
vim.opt.termguicolors = true
-- vim.cmd.colorscheme("default")
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" }) -- background transparent
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.signcolumn = "yes"        -- Prevent layout shift by always showing sign column
vim.opt.fillchars:append("eob: ") -- Remove ~ on end of buffer
vim.opt.cmdheight = 0

-- Terminal
vim.opt.title = true

-- File
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
