return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    require("conform").setup({
      formatters_by_ft = {
        lua = {
          "stylua",
          config = {
            extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") }
          }
        },
        python = { "isort", "black" },
        javascript = { "prettier" }, -- Prettier utilise automatiquement .prettierrc
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        java = { "google-java-format" },
        ruby = { "rubocop" },
        php = { "php-cs-fixer" },
        go = { "gofmt", "goimports" },
        terraform = { "terraform-fmt" },
        dockerfile = { "dockerfilelint" },
        sql = { "sql-formatter" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>bf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format buffer or range (in visual mode)" })
  end
}
