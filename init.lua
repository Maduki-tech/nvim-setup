local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
				vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	end



require("setfile")
require("lsp-config")
require("keymap")

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'gruvbox-community/gruvbox'
	use 'itchyny/lightline.vim' -- Fancier statusline
	use 'lukas-reineke/indent-blankline.nvim'
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/playground'
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- WEBDEV
	use 'jiangmiao/auto-pairs'
	use 'maxmellon/vim-jsx-pretty'
	use 'mattn/emmet-vim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function() require'nvim-tree'.setup {} end
	}


	-- GIT
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use 'tpope/vim-fugitive' -- Git commands in nvi
	use 'sbdchd/neoformat'




end)



-------- GENERAL KEYBOARD SHORTCUTS -----------

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>:vsplit <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>:wincmd h <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>:wincmd j <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>:wincmd k <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>:wincmd l <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', '<cmd>:x <CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-b>', ':NERDTreeToggle <CR>', {})
-- vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>bh', '<cmd>lua require"dev.bfullcomment".HeaderComment()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>bs', '<cmd>lua require"dev.bfullcomment".LineSeperator()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>bc', '<cmd>lua require"dev.bfullcomment".simpleOne()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>+', '<cmd>:wincmd + <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>-', '<cmd>:wincmd - <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>.', '<cmd>:vertical resize +5<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>,', '<cmd>:vertical resize -5<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>=', '<cmd>:wincmd = <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Neoformat <CR>', {})

vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>:NvimTreeToggle <CR>', {})


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


vim.g.indent_blankline_char = ''


------------------ GENERAL CONFIG ------------------

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { hl = 'GitGutterAdd', text = '+' },
		change = { hl = 'GitGutterChange', text = '~' },
		delete = { hl = 'GitGutterDelete', text = '_' },
		topdelete = { hl = 'GitGutterDelete', text = '‾' },
		changedelete = { hl = 'GitGutterChange', text = '~' },
	},
}


-- Telescope
require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules"
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}


-- ADD Telescope shortcuts
-- IMPORTANT SHORTCUTS
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<Plug>(prettier-format)]], { noremap = true, silent = true })


-- TESTING SHORTCUTS
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })



-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
}
vim.cmd[[
augroup trimWhiteSpace
autocmd!
autocmd BufWritePre * %s/\s\+$//e
autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
]]


-- CPP AUTO RUN
vim.cmd[[
autocmd vimEnter *.cpp nnoremap <C-r> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi<CR>
]]
