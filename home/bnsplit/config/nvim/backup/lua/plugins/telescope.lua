return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-tree/nvim-web-devicons",
            enabled = function() return vim.g.have_nerd_font end,
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = require("telescope.themes").get_dropdown()
            },
            defaults = {
              file_ignore_patterns = {
                "node_modules/", ".git/"
              }
            }
        })

        -- Activer les extensions Telescope si installées
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>r", builtin.oldfiles, {desc = "Search previously closed files"})
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, {desc = "Search Files"})
        vim.keymap.set("n", "<leader>f", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, {desc = "Fuzzily search in current buffer"})
    end,
}
