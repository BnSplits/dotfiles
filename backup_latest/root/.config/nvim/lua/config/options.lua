local opt = vim.opt

-- Scrolling behavior and line display
opt.scrolloff = 8  -- Always show 8 lines above and below the cursor
opt.number = true  -- Show absolute line numbers
opt.relativenumber = false  -- Disable relative line numbers

-- Tab and indentation settings
opt.tabstop = 2  -- Width of a tab character: 4 spaces
opt.shiftwidth = 2  -- Indent level when using indentation commands
opt.expandtab = true  -- Convert tabs to spaces
opt.autoindent = true  -- Enable automatic indentation

-- Line display and wrapping
opt.wrap = true  -- Enable line wrapping for long lines
opt.showbreak = "󱞪    "  -- Prefix shown on wrapped lines

-- Search settings
opt.ignorecase = true  -- Ignore case when searching
opt.smartcase = true  -- Enable case sensitivity if the search query contains uppercase letters

-- Appearance
opt.cursorline = true  -- Highlight the current line
opt.termguicolors = true  -- Enable 24-bit colors in the terminal
opt.background = "dark"  -- Set background to dark theme
opt.signcolumn = "yes"  -- Always show the sign column (e.g., for errors and warnings)

-- Backspace behavior
opt.backspace = "indent,eol,start"  -- Allow backspace to work on indentations, end of line, and beginning of line

-- System clipboard usage
opt.clipboard:append("unnamedplus")  -- Use the system clipboard for copy-pasting

-- Window behavior
opt.splitright = true  -- Open new vertical windows to the right
opt.splitbelow = true  -- Open new horizontal windows below

-- Session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Temporary highlight after a yank (copy) action
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",  -- Highlight group
      timeout = 150,  -- Duration in milliseconds
    })
  end,
})

-- Enable persistent undo and set undo directory
opt.undofile = true  -- Enable persistent undo
local undo_dir = vim.fn.expand("~/.config/nvim/undo")
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
