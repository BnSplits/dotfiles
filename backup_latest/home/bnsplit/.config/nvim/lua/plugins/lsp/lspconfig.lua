return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap     -- Pour la concision

    -- Configuration pour les bordures et angles arrondis des fenêtres LSP
    local border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
      { border = border })
    vim.diagnostic.config({
      float = { border = border },
    })

    -- Crée un autocmd pour les événements LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",
          vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
        keymap.set("n", "gD", vim.lsp.buf.declaration,
          vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
          vim.tbl_extend("force", opts, { desc = "Show LSP definitions" }))
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
          vim.tbl_extend("force", opts, { desc = "Show LSP implementations" }))
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
          vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" }))
        keymap.set("n", "<leader>rs", vim.lsp.buf.rename,
          vim.tbl_extend("force", opts, { desc = "Smart rename" }))
        keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>",
          vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" }))
        keymap.set("n", "[d", vim.diagnostic.goto_prev,
          vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" }))
        keymap.set("n", "]d", vim.diagnostic.goto_next,
          vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" }))
        keymap.set("n", "K", vim.lsp.buf.hover,
          vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" }))
        keymap.set("n", "<leader>rl", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })
    -- Capabilities pour l'autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Modifier les symboles de Diagnostic dans la colonne de signes
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Fonction pour configurer le formatage à 2 espaces
    local format_on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_buf_set_option(bufnr, "tabstop", 2)
        vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 2)
        vim.api.nvim_buf_set_option(bufnr, "expandtab", true)
      end
    end

    -- Configuration des serveurs LSP
    mason_lspconfig.setup_handlers({
      -- Gestion par défaut pour les serveurs installés
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = format_on_attach,
        })
      end,
      -- Configuration pour Emmet
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "javascript", "typescript", "css", "sass", "scss", "less", "svelte" },
          on_attach = format_on_attach,
        })
      end,
      -- Configuration pour Lua
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
          on_attach = format_on_attach,
        })
      end,
    })
  end,
}
