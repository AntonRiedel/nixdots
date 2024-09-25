return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		icons_enabled = true,
		theme = "horizon",
		extensions = {
			"oil",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
