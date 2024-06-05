local md_headers_status_ok, md_headers = pcall(require, 'md-headers')
if not md_headers_status_ok then
    return
end

-- Configure the popup window settings.
md_headers.setup {
    width = 60,
    height = 40,
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'}
}

-- Shorten function name.
local keymap = vim.keymap.set
-- Silent keymap option.
local opts = { silent = true }

-- Set keymap.
-- keymap('n', '<leader>m', ':MarkdownHeaders<CR>', opts)
keymap('n', '<leader>m', ':MarkdownHeadersClosest<CR>', opts)
