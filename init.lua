require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
-- require "user.rnvimr"
require "user.lualine"
-- require "user.marks"
require "user.telescope"
require "user.nvim-tree"
require "user.vimwiki"
require "user.folds"

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require "user.catppuccin"
vim.cmd [[colorscheme catppuccin]]

require "user.treesitter"
require('nvim_comment').setup()
require("user.markdown-headers")
require("user.markdown-preview")

vim.wo.relativenumber = true

vim.cmd(":hi rainbow1 guifg=#ed8796")
vim.cmd(":hi rainbow2 guifg=#a6da95")
vim.cmd(":hi rainbow3 guifg=#8aadf4")
vim.cmd(":hi rainbow4 guifg=#c6a0f6")
vim.cmd(":hi rainbow5 guifg=#c6a0f6")
vim.cmd(":hi rainbow6 guifg=#eed49f")
-- vim.cmd"setlocal conceallevel=2"

require("symbols-outline").setup()

vim.cmd(":set listchars=tab:->,space:.")
vim.cmd(":set list")

vim.cmd([[
augroup explicit_noexpandtab
    autocmd!
    autocmd BufEnter,BufNew * setlocal noexpandtab
augroup END
]])

vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set tw=80"})
vim.cmd(":au BufWrite,BufEnter *.md silent !vimwiki_html_single %:p")
