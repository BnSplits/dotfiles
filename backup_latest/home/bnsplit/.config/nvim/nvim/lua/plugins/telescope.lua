return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }, "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = function()
    local builtin = require('telescope.builtin')
    local telescope = require("telescope")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find old files" })
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find string under cursor" })
    vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
    vim.keymap.set({ "n", "v" }, '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = "Current buffer fuzzy find" })
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffers"})
    --
    telescope.load_extension("fzf")
  end
}
