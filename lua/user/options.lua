local options = {
  spelllang = {"pl","en_us"},
  spellsuggest = {"best", 9},
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- noexpandtab = true,                        -- convert tabs to spaces
  shiftwidth = 8,                          -- the number of spaces inserted for each indentation
  tabstop = 8,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

vim.keymap.set("n", "<F11>", function()
  vim.o.spell = not vim.o.spell
  print("spell: " .. tostring(vim.o.spell))
end)
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd "let g:c_syntax_for_h = 1"
vim.cmd "syntax on"
vim.cmd "filetype plugin on"
vim.cmd "set nocompatible"
vim.cmd "let g:vimwiki_key_mappings = {}"
vim.cmd "let g:vimwiki_key_mappings.table_mappings = 0"
vim.cmd "set foldlevel=99" -- This opens all folds on file open
vim.cmd "let g:airline_powerline_fonts = 1"
vim.cmd "set textwidth=0"
vim.cmd "set wrapmargin=1"
vim.cmd "set formatoptions+=t"
vim.cmd "set formatoptions-=l"
