return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		incremental_selection = { enable = true },
		textobjects = { enable = true },
	},
}
