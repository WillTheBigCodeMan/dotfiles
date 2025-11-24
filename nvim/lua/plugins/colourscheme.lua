return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			opts.integrations = {
				telescope = {
					enabled = true,
				},
				which_key = true,
				mason = true,
				barbar = true,
				blink_cmp = {
					style = "bordered",
				},
				blink_indent = true,
				snacks = {
					enabled = true,
				},
			}
		end,
	},
	{
		"shaunsingh/nord.nvim",
	},
}
