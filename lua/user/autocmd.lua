
----------------- GENERAL CONFIG ------------------
-- Highlight on yank
vim.api.nvim_exec(
    [[
	augroup YankHighlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]],
    false
)

vim.g.indent_blankline_char = ""

vim.cmd [[
autocmd vimEnter *.go nnoremap <C-r> :w <CR> :!go run . <CR>
]]

vim.g.snippets = "luasnip"
