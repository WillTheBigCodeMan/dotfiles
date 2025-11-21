vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			["shfmt"] = {
				prepend_args = { "-ln", "bash" },
			},
			["clang-format"] = {
				args = "-style='{IndentWidth: 4,}'",
			},
			["prettier"] = {
				prepend_args = { "--tab-width", "4" },
			},
		},
		formatters_by_ft = {
            lua = { "stylua" },
			awk = { "awk" },
			c = { "clang-format" },
			rust = { "rustfmt" },
			json = { "prettier" },
			html = { "prettier" },
			go = { "gofmt" },
			javascript = { "prettier" },
		},
	},
}
