return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    })

    -- Corrected keymap
    vim.keymap.set("n", "<leader>b", vim.lsp.buf.format, { desc = "Format buffer" })
  end
}

