local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end
nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")
