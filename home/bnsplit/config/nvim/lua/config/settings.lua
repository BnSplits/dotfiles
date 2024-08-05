-- Global variables --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Clear highlights on search with <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<C-l>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
	desc = "Open diagnostic Quickfix list",
})
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
	desc = "Exit terminal mode",
})

vim.keymap.set("n", "<leader>z", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree", noremap = true, silent = true })

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", {
	desc = "Move focus to the left window",
})
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", {
	desc = "Move focus to the right window",
})
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", {
	desc = "Move focus to the lower window",
})
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", {
	desc = "Move focus to the upper window",
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {
		clear = true,
	}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Options --
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.undofile = file
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.cmd([[autocmd VimEnter * NvimTreeOpen]])
