local opt = vim.opt

opt.scrolloff = 8  -- Affiche toujours 8 lignes au-dessus et en dessous du curseur

opt.number = true  -- Affiche les numéros de ligne absolus

opt.relativenumber = true  -- Affiche les numéros de ligne relatifs par rapport à la ligne actuelle

opt.tabstop = 2  -- Définit la largeur d'un tab en tant que 2 espaces

opt.shiftwidth = 2  -- Définit le niveau de décalage lors de l'utilisation des touches de tabulation comme étant 2 espaces

opt.expandtab = true  -- Convertit les tabulations en espaces

opt.autoindent = false  -- Désactive l'auto-indentation

opt.wrap = false  -- Désactive le retour à la ligne automatique des lignes longues

opt.ignorecase = true  -- Ignore la casse lors de la recherche

opt.smartcase = true  -- Active la sensibilité à la casse si la recherche contient des majuscules

opt.cursorline = true  -- Active la mise en surbrillance de la ligne courante

opt.termguicolors = true  -- Active les couleurs 24-bit (true colors) dans le terminal

opt.background = "dark"  -- Définit le thème de fond sur "dark" (fond sombre)

opt.signcolumn = "yes"  -- Toujours afficher la colonne des signes (e.g., pour les erreurs et autres)

opt.backspace = "indent,eol,start"  -- Configure la touche de retour arrière pour supprimer l'indentation, la fin de ligne, et le début de la ligne

opt.clipboard:append("unnamedplus")  -- Utilise le registre du système (+) pour le copier-coller

opt.splitright = true  -- Ouvre les nouvelles fenêtres verticales à droite

opt.splitbelow = true  -- Ouvre les nouvelles fenêtres horizontales en dessous

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"  -- Configure les options de session pour inclure divers éléments comme les buffers, les répertoires courants, etc.

-- Surbrillance temporaire après une action de yank (copie)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",  -- Le groupe de surlignage que tu veux utiliser
      timeout = 70,  -- Durée du surlignage en millisecondes
    })
  end,
})

opt.undofile = true  -- Activer l'undo persistant

-- Spécifier le répertoire où les fichiers d'undo seront stockés
-- Crée le répertoire si nécessaire
local undo_dir = vim.fn.expand("~/.config/nvim/undo")
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end

opt.undodir = undo_dir
