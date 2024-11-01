return {
	"nvim-neorg/neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.completion"] = { config = { engine = "nvim-cmp", name = "[Neorg]" } },
				["core.concealer"] = { config = { icon_preset = "diamond" } },
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
