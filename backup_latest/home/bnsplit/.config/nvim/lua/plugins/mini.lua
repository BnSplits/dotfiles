return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VimEnter",
  config = function()
    -- Vérifie si Neovim n'est pas sur Alpha avant de charger les configurations
    local function is_not_alpha()
      return vim.fn.exists("b:alpha") == 0
    end

    if is_not_alpha() then
      require("mini.statusline").setup()
      require("mini.pairs").setup()
      -- require("mini.comment").setup()
      require("mini.surround").setup()
      -- require("mini.indentscope").setup({
      --   symbol = "│",
      --   options = {
      --     try_as_border = true,
      --   },
      -- })
      -- Ajoute d'autres modules ici si besoin
    end
  end,
}
