-- return {
--     "tiagovla/tokyodark.nvim",
--     opts = {
--         gamma = 0.7
--         -- custom options here
--     },
--     config = function(_, opts)
--         require("tokyodark").setup(opts) -- calling setup is optional
--         vim.cmd("colorscheme tokyodark")
--     end,
-- }
--
-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000,
--   config = function()
--     require("onedarkpro").setup {
--
--       colors = {
--         dark = {bg = "#05040a"}
--       }
--     }
--     vim.cmd("colorscheme onedark_dark")
--   end
-- }
--
return {
  "luisiacc/gruvbox-baby",
  config = function()
    --   require("gruvbox-baby").setup({
    --
    --     background_color = "dark"
    --
    --   })
    vim.g.gruvbox_baby_background_color = "dark"
    vim.cmd("colorscheme gruvbox-baby")
  end,

}
