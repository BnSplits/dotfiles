return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded", -- ou "single", "double", "shadow", etc.
        },
      })
    end,
  },
  -- Mason LSP config integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  -- Mason tool installer for auto installing tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSP servers
          "lua-language-server",
          "typescript-language-server",
          "html-lsp",
          "css-lsp",
          "json-lsp",
          "marksman",
          "pyright",
          -- Linters
          "eslint_d",

          -- Formatters
          "prettierd",
          "stylua",
          "isort",
          "black",
          -- DAP (Debug Adapter Protocols)
          -- add DAP tools here
        },
        auto_update = true,
        run_on_start = true,
        ui = {
          border = "rounded", -- ou "single", "double", "shadow", etc.
        },
      })
    end,
  },
  -- Additional LSP configurations
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Example LSP server setup
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.marksman.setup({})
      -- add more LSP server setups as needed

      vim.keymap.set(
        { "n", "v" },
        "<leader>ca",
        vim.lsp.buf.code_action,
        { desc = "Show available code actions" }
      )
    end,
  },
  -- DAP configurations (example)
  -- {
  --     "mfussenegger/nvim-dap",
  --     config = function()
  --         local dap = require("dap")
  --         -- Example DAP configuration
  --         dap.adapters.lldb = {
  --             type = 'executable',
  --             command = '/usr/bin/lldb-vscode', -- adjust as needed
  --             name = "lldb"
  --         }
  --         dap.configurations.cpp = {
  --             {
  --                 name = "Launch",
  --                 type = "lldb",
  --                 request = "launch",
  --                 program = function()
  --                     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --                 end,
  --                 cwd = '${workspaceFolder}',
  --                 stopOnEntry = false,
  --                 args = {},
  --             },
  --         }
  --         dap.configurations.c = dap.configurations.cpp
  --         dap.configurations.rust = dap.configurations.cpp
  --     end
  -- },
}
