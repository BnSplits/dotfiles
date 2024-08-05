return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("nvim-treesitter").setup({
            build = 'TSUpdate',
            ensure_installed = {
                "lua",
                "javascript",
                "html",
                "query",
                "markdown",
                "typescript",
                "tsx",
                "css"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            sync_install = false,
            indent = {
                enable = true
            }
        })
    end
}
