-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.cmd("source ~/.config/nvim/color.lua")

-- vim.cmd("colorscheme lushwal")
