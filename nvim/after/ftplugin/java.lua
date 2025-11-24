vim.lsp.config["jdtls"].capabilities = require("blink.cmp").get_lsp_capabilities()
local root = vim.fs.root(0, { "src" })
vim.lsp.config["jdtls"].root_dir = root
local src = vim.fs.find("src", { limit = math.huge, path = root, type = "directory" })

for i, n in pairs(src) do
	if root ~= nil then
		src[i] = string.gsub(n, root, ".")
	end
end

vim.lsp.config["jdtls"].settings = {
	java = {
		project = {
			referencedLibraries = {
				"lib/*.jar",
				"*/**/lib/*.jar",
			},
			sourcePaths = src,
		},
	},
}
