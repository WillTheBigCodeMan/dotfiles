vim.lsp.config["jdtls"].capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config["jdtls"].root_dir = vim.fs.root(0, { ".git", "src" })
vim.lsp.config["jdtls"].settings = {
	java = {
		project = {
			referencedLibraries = {
				"lib/*.jar",
			},
			sourcePaths = { "src" },
		},
	},
}
