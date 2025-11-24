require("config.lazy")
require("config.keymaps")

local opt = vim.opt
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.cursorline = true
opt.number = true
opt.relativenumber = true
vim.cmd([[colorscheme nord]])

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

local focus_lost_group = vim.api.nvim_create_augroup("focus", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Write shared data on buffer change",
	group = focus_lost_group,
	callback = function()
		vim.highlight.on_yank()
		vim.cmd.wshada()
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	desc = "Read shared data on focus gained",
	group = focus_lost_group,
	callback = vim.schedule_wrap(function()
		vim.cmd.sleep("100m")
		vim.cmd.rshada()
	end),
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.treesitter.start()
	end,
})
