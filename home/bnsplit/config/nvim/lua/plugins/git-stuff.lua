return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({

				vim.keymap.set(
					"n",
					"<leader>gp",
					":Gitsigns preview_hunk<CR>",
					{ desc = "Show gitsign changes", silent = true }
				),
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
