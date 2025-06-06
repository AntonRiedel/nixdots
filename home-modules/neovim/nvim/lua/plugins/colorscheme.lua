return {
	-- the colorscheme should be available when starting Neovim
	{
		"EdenEast/nightfox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.o.termguicolors = true
			vim.cmd([[colorscheme carbonfox]])
		end,
	},
}
