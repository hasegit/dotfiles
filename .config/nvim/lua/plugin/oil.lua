vim.api.nvim_set_hl(0, "OilFloatBorder", { fg = "#aa64ff" }) -- floatの枠線の色を変更

require("oil").setup({
  -- フローティングウィンドウの設定
  float = {
    padding = 2,
    max_width = 80,
    max_height = 20,
    border = "rounded",
    win_options = {
      winblend = 10, -- 少し透けさせる
      winhighlight = "Normal:NormalFloat,FloatBorder:OilFloatBorder",
    },
  },
  -- キーバインド設定
  keymaps = {
    ["q"] = "actions.close",     -- 閉じる
  },
})
