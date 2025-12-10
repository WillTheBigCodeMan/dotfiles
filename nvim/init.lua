require("config.lazy")
require("config.keymaps")

local opt = vim.opt
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.linebreak = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
-- opt.statuscolumn = " %l "
opt.viminfo = "'100,<0,s10,h"
vim.cmd([[colorscheme catppuccin-macchiato]])

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return string.format("✘ : %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				return string.format("▲ : %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				return string.format("⚑ : %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.INFO then
				return string.format("» : %s", diagnostic.message)
			end
			return diagnostic.message
		end,
	},

	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
