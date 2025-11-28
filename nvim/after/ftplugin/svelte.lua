vim.lsp.config["svelte"].capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config["svelte"].on_attach = function(client, bufnr)
	if client.name == "svelte" then
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts", "*.svelte" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
			end,
		})
	end
	if vim.bo[bufnr].filetype == "svelte" then
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts", "*.svelte" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
			end,
		})
	end
end
