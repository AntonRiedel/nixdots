return {
	"nvim-neorg/neorg",
	ft = "norg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/nextcloud/notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,
}
