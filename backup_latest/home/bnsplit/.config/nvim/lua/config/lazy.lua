local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { { import = "plugins" }, { import = "plugins.lsp"} },
  },
  checker = { enabled = true },
  ui = {
    border = "rounded"
  }
})

-- Fonction pour mettre à jour les plugins sans afficher la fenêtre
-- local function update_plugins()
--     require('lazy').update({ silent = true }) -- Met à jour les plugins silencieusement
-- end

-- Exécute la mise à jour des plugins au démarrage
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         update_plugins()
--     end,
-- })
