return  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
	      enable = true,
	      keymaps = {
		      init_selection = "<C-space>",
		      node_incremental = "<C-space>",
		      scope_incremental = false,
		      node_decremental = "<bs>",
	      },
      },
    },
    config = function(_, opts)
	    require("nvim-treesitter.config").setup(opts)
	    require("nvim-treesitter").install(opts.ensure_installed)
    end
  }

