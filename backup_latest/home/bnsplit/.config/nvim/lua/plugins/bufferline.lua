return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup{}

    local keymap = vim.keymap

    keymap.set("n","<leader>bn","<cmd>BufferLineCycleNext<CR>", {desc = "Go to next buffer"})
    keymap.set("n","<leader>bp","<cmd>BufferLineCyclePrev<CR>", {desc = "Go to previous buffer"})
    keymap.set("n","<leader>bc","<cmd>BufferLinePickClose<CR>", {desc = "Close selected buffer"})
    keymap.set("n","<leader>b1","<cmd>BufferLineGoToBuffer 1<CR>", {desc = "Go to first buffer"})
    keymap.set("n","<leader>b0","<cmd>BufferLineGoToBuffer -1<CR>", {desc = "Go to last buffer"})
  end,
}
