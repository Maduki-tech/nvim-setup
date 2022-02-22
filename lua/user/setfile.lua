-- SETFILES FOR

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

-- SET THE WIDTH FOR THE TABS
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.swapfile = false

--Set highlight on search
vim.o.hlsearch = false

-- NO wrap
vim.o.wrap = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true


--Save undo history
vim.opt.undofile = false


--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

-- MAKE SCROLL OFF
vim.o.scrolloff = 8
vim.o.sidescrolloff = 15


--Set colorscheme (order is important here)

vim.cmd[[
augroup ChangeBackgroudColour
	autocmd colorscheme * :hi normal guibg=none
augroup END
]]
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[set colorcolumn=80 ]]
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=grey]]
vim.cmd [[colorscheme gruvbox]]


vim.g.user_emmet_leader_key = '<C-e>'
vim.g.user_emmet_mode = 'inv'    --enable all function in all mode.
vim.g.nvim_tree_quit_on_open = 1 -- NVIM-TREE WILL CLOSE WHEN OPEN FILE




--Set statusbar
vim.g.lightline = {
	colorscheme = 'gruvbox',
	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
	component_function = { gitbranch = 'fugitive#head'},
}

