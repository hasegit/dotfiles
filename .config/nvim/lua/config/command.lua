-- ファイルを開いたときに、前回のカーソル位置を復元する
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    -- '"' は最後にファイルを閉じたときのカーソル位置を示す特殊なマーク
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    -- マークの位置が有効な行数内であれば、その位置にカーソルを移動
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- VimEnter を追加して、起動直後に確実に上書きする
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufFilePost" }, {
  pattern = "*",
  callback = function()
    local filename = vim.fn.expand("%:t")
    local ext = vim.fn.expand("%:e")
    local icon = ""

    -- 1. ファイル名を指定せずに起動した直後などの場合
    if filename == "" then
      vim.opt.titlestring = " Neovim" -- 起動画面用のアイコンとテキスト
      return
    end

    -- 2. アイコンの取得
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if ok then
      local fetched_icon, _ = devicons.get_icon(filename, ext, { default = true })
      if fetched_icon then
        icon = fetched_icon .. " "
      end
    end

    -- 3. タイトルの更新（変更がある場合は [+] を付ける）
    vim.opt.titlestring = icon .. " " .. filename .. "%m"
  end,
})

-- パッケージ管理のコマンドを定義
vim.api.nvim_create_user_command("Packdel", function(opts)
  vim.pack.del({ opts.args })
  print("Deleted package: " .. opts.args)
end, {
  nargs = 1,
  desc = "Delete a package",
})

vim.api.nvim_create_user_command("Packlist", function()
  local plugins = vim.pack.get()
  for _, plugin in pairs(plugins) do
    print(vim.inspect(plugin.spec.name))
  end
end, {
  desc = "List installed packages",
})
