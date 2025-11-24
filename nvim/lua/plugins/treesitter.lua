return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "javascript" },
		highlight = { enable = true },
		incremental_selection = { enable = true },
		textobjects = { enable = true },
		indent = { enable = true },
	},
}
