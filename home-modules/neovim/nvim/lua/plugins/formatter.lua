return {
	"mhartington/formatter.nvim",
	-- dont use opts because we need to require formatter for the setupt itself
	cmd = { "Format", "FormatLock", "FormatWrite", "FormatWriteLock" },
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				latex = {
					require("formatter.filetypes.lua").latexindent,
				},
				tex = {
					require("formatter.filetypes.lua").latexindent,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				cpp = {
					require("formatter.filetypes.cpp").clangformat,
				},
				python = {
					require("formatter.filetypes.python").black,
				},
				json = {
					require("formatter.filetypes.json").jq,
				},
				nix = {
					require("formatter.filetypes.nix").nixfmt,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
