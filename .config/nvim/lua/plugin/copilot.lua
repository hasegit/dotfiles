require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    hide_during_completion = false,
    keymap = {
      accept = "<C-a>",
      accept_word = "<C-w>",
    },
  },
  filetypes = {
    markdown = true,
    gitcommit = true,
    ['*'] = function()
      -- disable for files with specific names
      local fname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
      local disable_patterns = { 'env', 'conf', 'local', 'private' }
      return vim.iter(disable_patterns):all(function(pattern)
        return not string.match(fname, pattern)
      end)
    end,
  },
})
