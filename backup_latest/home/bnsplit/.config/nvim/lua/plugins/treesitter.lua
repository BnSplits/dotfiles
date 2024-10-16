return {
"nvim-treesitter/nvim-treesitter",
  config = function() 
    require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript","tsx","html","css","json", "bash", "markdown", "markdown_inline" , "java" },

    sync_install = false,

    auto_install = true,

    highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    },
  }
  end
}
