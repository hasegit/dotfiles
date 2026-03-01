vim.lsp.enable({
  "lua_ls",
  "vtsls"
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
  float = {
    border = "rounded",
    title = "Diag",
    header = "",
    prefix = "󱉶 ",
    suffix = "",
    format = function(diag)
      if diag.code then
        return string.format('%s [%s:%s]', diag.message, diag.source, diag.code)
      else
        return string.format('%s [%s]', diag.message, diag.source)
      end
    end,
  },
  signs = {
    text = {
      [severity.ERROR] = "󱠇 ",
      [severity.WARN] = "󰮔 ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    }
  }
})
