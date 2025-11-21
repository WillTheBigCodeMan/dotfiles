return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		vim.o.foldcolumn = "1" -- Show a small column for folds
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
