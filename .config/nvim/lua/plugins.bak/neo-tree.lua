return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
	    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
	    { "<leader>gt", "<cmd>Neotree git_status toggle<cr>", desc = "Toggle file explorer" },
    },
    opts = {
	default_component_configs = {
		name = {
			use_git_status_colors = false,
		},
	},
	    window = { mappings = { ["<space>"] = "none" }}
    }
  }
}
