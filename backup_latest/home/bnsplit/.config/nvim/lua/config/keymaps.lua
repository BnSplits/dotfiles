local g = vim.g
local keymap = vim.keymap

g.mapleader = " "
g.maplocalleader = " "

vim.keymap.set("n", "<leader>H", function()
  vim.cmd("nohlsearch")
  vim.cmd("echo ''")
end, { desc = "Clear highlights/commands bar" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Commandes pour cycler entre les splits
keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Cycle to the next split" })
keymap.set("n", "<leader>sp", "<C-w>W", { desc = "Cycle to the previous split" })
