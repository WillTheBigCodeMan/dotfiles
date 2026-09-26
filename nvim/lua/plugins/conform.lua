return {
	"stevearc/conform.nvim",
	opts = {
		log_level = vim.log.levels.DEBUG,
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
			-- For some reason it knows to treat this as -style="{...}"
			["clang-format"] = {
				prepend_args = { "-style", "{IndentWidth: 4}" },
			},

			hindent = {
				prepend_args = { "--indent-size", 4 },
			},
			prettypst = {
				prepend_args = {
					"--style",
					"otbs",
					"--file-location",
					"~/.config/nvim/lua/plugins/prettypst.toml",
				},
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
			svelte = { "prettier" },
			c = { "clang-format" },
			["cpp"] = { "clang-format" },
			haskell = { "hindent" },
			typst = { "prettypst" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
