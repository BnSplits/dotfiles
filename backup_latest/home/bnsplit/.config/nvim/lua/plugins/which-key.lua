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
      -- {
      --   "<leader>b",
      --   "<cmd>Telescope buffers<CR>",
      --   desc = "Buffers" -- Group for managing buffers
      -- },
      {
        "<leader>f",
        "",
        desc = "Fuzzy Finder" -- Group for fuzzy finding files
      },
      {
        "<leader>r",
        "",
        desc = "Renames" -- Group for fuzzy finding files
      },
      {
        "<leader>l",
        "",
        desc = "LSP Actions" -- Group for LSP actions
      },
      {
        "<leader>s",
        "",
        desc = "Split" -- Group for split actions
      },
      {
        "<leader>x",
        "",
        desc = "Debug" -- Group for debugging actions
      },
      {
        "<leader>c",
        "",
        desc = "Change Directory"
      },
      {
        "<leader>gt",
        "",
        desc = "Toggle gitlens actions"
      },
      {
        "<leader>g",
        "",
        desc = "Gitlens actions"
      },
    },
  }
}
