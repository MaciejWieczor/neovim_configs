-- vim.cmd("let g:vimwiki_list = [{'path': '~/Vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
--
-- vim.cmd("let g:vimwiki_color_dic = {'bred': [ '#181926', '#ed8796'], 'bblue': [ '#181926', '#8aadf4	'], 'bgreen': [ '#181926', '#a6da95']}")
--
-- -- vim.cmd("let g:vimwiki_hl_headers = 1")
-- --
-- --
-- -- vim.cmd("set foldcolumn=2")
-- -- vim.cmd("let g:vimwiki_folding = 'custom'")
-- vim.cmd("let g:markdown_folding = 1")

--
-- vim.cmd([[
--         augroup Mkd
--         au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setlocal syntax=markdown
--         au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setlocal syntax=markdown
--         augroup END
-- ]])
--
--
-- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
require('mkdnflow').setup({
    modules = {
        bib = true,
        buffers = true,
        conceal = true,
        cursor = true,
        folds = true,
        links = true,
        lists = true,
        maps = true,
        paths = true,
        tables = true,
        yaml = false
    },
    filetypes = {md = true, rmd = true, markdown = true},
    create_dirs = true,             
    perspective = {
        priority = 'root',
        fallback = 'current',
        root_tell = 'strona-główna.md',
        nvim_wd_heel = false,
        update = false
    },    
    wrap = false,
    bib = {
        default_path = nil,
        find_in_root = true
    },
    silent = false,
    links = {
        style = 'markdown',
        name_is_source = false,
        conceal = true,
        context = 0,
        implicit_extension = nil,
        transform_implicit = false,
        transform_explicit = function(text)
            text = text:gsub(" ", "_")
            text = text:lower()
            local dir = vim.api.nvim_buf_get_name(0):match(".*[/]")
	    local path = string.gsub(dir, "/home/maciej/Vimwiki/", "")
            text = path..text
            return(text)
        end
    },
    new_file_template = {
        use_template = true,
        placeholders = {
            before = {
                title = "link_title",
                date = "os_date",
		test = function()
			local dir = vim.api.nvim_buf_get_name(0):match(".*[/]")
			local path = string.gsub(dir, "/home/maciej/Vimwiki/", "")
			local tokens = {}
			local full_path = ""
			local final_string = ""
			for word in string.gmatch(path, '([^/]+)') do
				table.insert(tokens, word)
			end
			local counter = 1
			for key,token in pairs(tokens) do
				if full_path ~= "" then
					full_path = full_path..'/'..token
				else
					full_path = token
				end
				local indent = string.rep("\t", counter)
            			local title_text = token:gsub("_", " ")
				title_text = title_text:gsub("(%l)(%w+)", function(a,b) return string.upper(a)..b end)
				local title = indent.."- ".."["..title_text.."]"
				local link = "("..full_path..'/'..token..".md)\n"
				final_string = final_string..title..link
				counter = counter + 1
			end
			return final_string
		end
            },
            after = {}
        },
        template = [[# {{ title }}
Spis treści:
<!-- vim-markdown-toc GFM -->

* [Stos](#stos)

<!-- vim-markdown-toc -->
# Stos
- [Strona Główna](strona-główna.md)
{{ test }}]]
    },
    to_do = {
        symbols = {' ', 'X'},
        update_parents = true,
        not_started = ' ',
        complete = 'X'
    },
    tables = {
        trim_whitespace = true,
        format_on_move = true,
        auto_extend_rows = false,
        auto_extend_cols = false
    },
    yaml = {
        bib = { override = false }
    },
    mappings = {
        MkdnEnter = {{'n', 'v'}, '<CR>'},
        MkdnTab = false,
        MkdnSTab = false,
        MkdnNextLink = {'n', '<Tab>'},
        MkdnPrevLink = {'n', '<S-Tab>'},
        MkdnNextHeading = {'n', ']]'},
        MkdnPrevHeading = {'n', '[['},
        MkdnGoBack = {'n', '<BS>'},
        MkdnGoForward = {'n', '<Del>'},
        MkdnCreateLink = false, -- see MkdnEnter
        MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'}, -- see MkdnEnter
        MkdnFollowLink = false, -- see MkdnEnter
        MkdnDestroyLink = {'n', '<M-CR>'},
        MkdnTagSpan = {'v', '<M-CR>'},
        MkdnMoveSource = {'n', '<F2>'},
        MkdnYankAnchorLink = {'n', 'yaa'},
        MkdnYankFileAnchorLink = {'n', 'yfa'},
        MkdnIncreaseHeading = {'n', '+'},
        MkdnDecreaseHeading = {'n', '-'},
        MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
        MkdnNewListItem = false,
        MkdnNewListItemBelowInsert = {'n', 'o'},
        MkdnNewListItemAboveInsert = {'n', 'O'},
        MkdnExtendList = false,
        MkdnUpdateNumbering = {'n', '<leader>nn'},
        MkdnTableNextCell = {'i', '<Tab>'},
        MkdnTablePrevCell = {'i', '<S-Tab>'},
        MkdnTableNextRow = false,
        MkdnTablePrevRow = {'i', '<M-CR>'},
        MkdnTableNewRowBelow = {'n', '<leader>ir'},
        MkdnTableNewRowAbove = {'n', '<leader>iR'},
        MkdnTableNewColAfter = {'n', '<leader>ic'},
        MkdnTableNewColBefore = {'n', '<leader>iC'},
        MkdnFoldSection = {'n', '<leader>f'},
        MkdnUnfoldSection = {'n', '<leader>F'}
    }
})
