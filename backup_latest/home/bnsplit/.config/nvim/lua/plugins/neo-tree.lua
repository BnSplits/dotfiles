return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See # Preview Mode for more information
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      window = {
        position = "float",
      },
    })

    -- Set Keymaps
    local keymap = vim.keymap
    vim.keymap.set("n", "<leader>cc",

      function()
        vim.cmd("cd ~/.config/nvim/")
        vim.cmd("echo 'Current dir : ~/.config/nvim'")
        vim.defer_fn(function()
          vim.cmd("echo ''")
        end, 3000)
      end
      ,
      { desc = "Go to config directory", silent = true })


    vim.keymap.set("n", "<leader>cd",

      function()
        vim.cmd("cd ~/dev/")
        vim.cmd("echo 'Current dir : ~/dev'")
        vim.defer_fn(function()
          vim.cmd("echo ''")
        end, 3000)
      end

      , { desc = "Go to dev directory", silent = true })

    keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>",
      { desc = "Toggle file explorer", noremap = true, silent = true })
  end,
}
