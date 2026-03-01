vim.api.nvim_set_hl(0, 'MiniPickBorder', { link = 'OilFloatBorder' })

require("mini.pick").setup({
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        -- 中央に配置するための計算
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = 'rounded', -- 枠線を丸くする
      }
    end,
  },
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
  }
})

