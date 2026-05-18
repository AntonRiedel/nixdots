return {
	"ibhagwan/fzf-lua",
	lazy = false,
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				preview = { layout = "vertical" },
			},
		})

		-- same keymaps you likely had in telescope
		vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", require("fzf-lua").help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fr", require("fzf-lua").oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>fd", require("fzf-lua").diagnostics_document, { desc = "Diagnostics" })
	end,
}
