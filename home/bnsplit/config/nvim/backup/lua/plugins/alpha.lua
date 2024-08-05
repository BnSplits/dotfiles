return {
    {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- Set header
dashboard.section.header.val = [[


                                              
       ████ ██████           █████      ██
      ███████████             █████ 
      █████████ ███████████████████ ███   ███████████
     █████████  ███    █████████████ █████ ██████████████
    █████████ ██████████ █████████ █████ █████ ████ █████
  ███████████ ███    ███ █████████ █████ █████ ████ █████
 ██████  █████████████████████ ████ █████ █████ ████ ██████

      ]]
-- Set menu
 dashboard.section.buttons.val = { 
--     dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     dashboard.button( "f", "  > Find files in /dev", ":cd $HOME/dev | Telescope find_files<CR>"),
--     dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
--     dashboard.button( "c", "  > Nvim Configuration" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--     dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
 }

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

vim.api.nvim_set_keymap('n', '<leader>a', ':Alpha<CR>', { desc = "Go to Alpha screen",noremap = true, silent = true })
    end
}
};
