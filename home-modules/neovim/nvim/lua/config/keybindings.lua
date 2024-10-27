local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space><space>", builtin.find_files)
vim.keymap.set("n", "<space>ff", builtin.find_files)
vim.keymap.set("n", "<space>fl", builtin.live_grep)
vim.keymap.set("n", "<space>fb", builtin.buffers)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>gw", builtin.grep_string)

local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

-- See `:help K` for why this keymap
nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<C-k>", vim.lsp.juf.signature_help, "Signature Documentation")

nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
nmap("<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")

-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_buf_create_user_command(bufnr, "LSPFormat", function(_)
	vim.lsp.buf.format()
end, { desc = "Format current buffer with LSP" })
