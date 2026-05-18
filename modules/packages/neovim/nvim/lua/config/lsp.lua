local capabilities = vim.lsp.protocol.make_client_capabilities()

-- advertise nvim-cmp completion capabilities to each server
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

local servers = {
	clangd = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp" },
		root_markers = { ".git", "compile_commands.json" },
	},
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { ".git", "pyproject.toml", "setup.py" },
	},
	bashls = { cmd = { "bash-language-server", "start" }, filetypes = { "bash", "sh" }, root_markers = { ".git" } },
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".git", ".luarc.json" },
		settings = { Lua = { diagnostics = { globals = { "vim" } } } },
	},
	texlab = {
		cmd = { "texlab" },
		filetypes = { "tex", "bib" },
		root_markers = { ".git", "latexmkrc" },
	},
	nixd = {
		cmd = { "nixd" },
		filetypes = { "nix" },
		root_markers = { ".git", "flake.nix" },
	},
	rust_analyzer = {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
		root_markers = { "Cargo.toml" },
	},
	ansiblels = { cmd = { "ansible-language-server", "--stdio" }, filetypes = { "yaml" }, root_markers = { ".git" } },
}

for name, config in pairs(servers) do
	vim.lsp.config[name] = vim.tbl_extend("force", config, { capabilities = capabilities })
	vim.lsp.enable(name)
end
