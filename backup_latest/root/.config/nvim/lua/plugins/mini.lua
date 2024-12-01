return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VimEnter",
  config = function()
    local function is_not_alpha_or_terminal()
      -- Vérifie si l'écran Alpha ou un terminal toggleterm est actif
      return vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "toggleterm"
    end

    if is_not_alpha_or_terminal() then
      require("mini.statusline").setup()
      require("mini.pairs").setup()
      -- require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup({
        symbol = "╎",
        options = {
          try_as_border = true,
        },
      })
    end

    -- Désactive mini.indentscope pour Alpha et Toggleterm
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "alpha", "toggleterm" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
