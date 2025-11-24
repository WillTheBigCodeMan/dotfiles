-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })
--
-- vim.api.nvim_get_current_buf()

return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			shfmt = {
				prepend_args = { "-ln", "bash" },
			},
			prettier = {
				prepend_args = { "--tab-width", "4" },
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
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
