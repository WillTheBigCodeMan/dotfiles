-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>od", vim.diagnostic.open_float, { desc = "Open error description" })
map("n", "<C-t>", "<leader>ws<cmd>term<cr>i", { desc = "Open terminal", remap = true })
map("t", "<C-t>", "<C-u><C-k>exit<cr><leader>wd", { desc = "Close terminal", remap = true })
map("n", "<leader>r", "<cmd>colorscheme lushwal<cr>", { desc = "Reload colorscheme" })
