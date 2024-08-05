return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    require("mini.ai").setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require("mini.surround").setup()

    -- Autopairs
    require("mini.pairs").setup()

    -- -- Simple and easy statusline.
    -- local statusline = require("mini.statusline")
    -- -- set use_icons to true if you have a Nerd Font
    -- statusline.setup({ use_icons = vim.g.have_nerd_font })
    -- -- You can configure sections in the statusline by overriding their
    -- statusline.section_location = function()
    --   return "%2l:%-2v"
    -- end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
