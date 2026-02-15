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
