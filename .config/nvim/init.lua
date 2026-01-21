-- requireするもの一覧
-- config
local configs = {
  "options",
  "ui",
  "commands",
  "lsp",
}
for _, name in ipairs(configs) do
  pcall(require, "configs." .. name)
end

-- plugins
local plugins = {
  "nvim-lspconfig",
  "mini_icons",
  "mini_ai",
  "mini_pairs",
  "mini_surround",
  "snacks_nvim",
  "which-key",
  "kanso",
  "blink_cmp",
}
for _, name in ipairs(plugins) do
  pcall(require, "plugins." .. name)
end
