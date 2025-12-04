return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			shfmt = {
				prepend_args = { "-ln", "bash" },
			},
			prettier = {
				append_args = function(self, ctx)
					if vim.endswith(ctx.filename, ".svelte") then
						return { "--tab-width", "4", "--plugin", "prettier-plugin-svelte" }
					end
					return { "--tab-width", "4" }
				end,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			awk = { "awk" },
			rust = { "rustfmt" },
			json = { "prettier" },
			html = { "prettier" },
			go = { "gofmt" },
			javascript = { "prettier" },
			svelte = { "prettier", lsp_format = "fallback" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
