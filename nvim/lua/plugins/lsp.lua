return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", config = true },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
				},
			},
		},
	},

	-- opts_extend = { "servers.*.keys" },
	-- opts = function()
	-- 	local ret = {
	-- 		servers = {
	-- 			["*"] = {
	-- 				capabilities = require("blink.cmp").get_lsp_capabilities(),
	-- 			},
	-- 			lua_ls = {
	-- 				settings = {
	-- 					Lua = {
	-- 						runtime = {
	-- 							version = "LuaJIT",
	-- 						},
	-- 						workspace = {
	-- 							library = {
	-- 								vim.env.VIMRUNTIME,
	-- 							},
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 			jdtls = {
	-- 				root_dir = vim.fs.root(0, { "src", "lib", "bin", ".git" }),
	-- 				settings = {
	-- 					java = {
	-- 						project = {
	-- 							referencedLibraries = {
	-- 								"lib/*.jar",
	-- 							},
	-- 							sourcePaths = { "src" },
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	}
	-- 	return ret
	-- end,
}
