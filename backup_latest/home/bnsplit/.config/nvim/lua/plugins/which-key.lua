return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = function()
        return 500
      end,
      win = {
        border = "rounded",
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      {
        "<leader>b",
        "<cmd>Telescope buffers<CR>",
        desc = "Buffers" -- Group for managing buffers
      },
      {
        "<leader>C",
        "<cmd>cd %:p:h<CR>",
        desc = "Change Directory" -- Group for changing directories
      },
      {
        "<leader>f",
        "<cmd>Telescope find_files<CR>",
        desc = "Fuzzy Finder" -- Group for fuzzy finding files
      },
      {
        "<leader>r",
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        desc = "LSP Actions" -- Group for LSP actions
      },
      {
        "<leader>s",
        "<cmd>split<CR>",
        desc = "Split" -- Group for split actions
      },
      {
        "<leader>x",
        "<cmd>lua require('dap').toggle_breakpoint()<CR>",
        desc = "Debug" -- Group for debugging actions
      },
      {
        "<leader>c",
        "",
        desc = "Change Directory"
      },
      {
        "<leader>t",
        "",
        desc = "Toggle gitlens actions"
      },
      {
        "<leader>h",
        "",
        desc = "Hunk gitlens actions"
      },



    },
  }
}
