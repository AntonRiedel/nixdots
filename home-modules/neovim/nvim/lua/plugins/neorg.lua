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
							work = "~/nextcloud/notes/work",
							private = "~/nextcloud/notes/private",
						},
						default_workspace = "work",
					},
				},
			},
		})
	end,
}
