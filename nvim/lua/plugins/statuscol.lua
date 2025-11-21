return {
	"luukvbaal/statuscol.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		return {
			setopt = true,
			thousands = false,
			relculright = false,
			ft_ignore = nil, -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
			bt_ignore = nil, -- Lua table with 'buftype' values for which 'statuscolumn' will be unset

			segments = {
				{ text = { "%C" }, click = "v:lua.ScFa" },
				{ text = { "%s" }, click = "v:lua.ScSa" },
			},
			clickmod = "c", -- modifier used for certain actions in the builtin clickhandlers:
			clickhandlers = { -- builtin click handlers, keys are pattern matched
				Lnum = require("statuscol.builtin").lnum_click,
				FoldClose = require("statuscol.builtin").foldclose_click,
				FoldOpen = require("statuscol.builtin").foldopen_click,
				FoldOther = require("statuscol.builtin").foldother_click,
				DapBreakpointRejected = require("statuscol.builtin").toggle_breakpoint,
				DapBreakpoint = require("statuscol.builtin").toggle_breakpoint,
				DapBreakpointCondition = require("statuscol.builtin").toggle_breakpoint,
				["diagnostic/signs"] = require("statuscol.builtin").diagnostic_click,
				gitsigns = require("statuscol.builtin").gitsigns_click,
			},
		}
	end,
}
