local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- AUTO INSTALL PACKER WHEN IT IS NOT ON THE PC
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("user.setfile")
require("user.lsp-config")
require("user.keymap")
require("user.gitsigns")
require("user.treesitter")
require("user.telescope")
require("user.nvim-comment")

local use = require("packer").use
require("packer").startup(
    function()
        use "wbthomason/packer.nvim" -- Package manager
        use "gruvbox-community/gruvbox" -- Best Color Ever
        use "itchyny/lightline.vim" -- Fancier statusline
        use "lukas-reineke/indent-blankline.nvim" -- Delete all the Blank lines
        -- Telescope Requirements
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- Treesitter
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "nvim-treesitter/playground"
        use "sbdchd/neoformat" -- formatting the text

        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp"
        use "epilande/vim-react-snippets" -- react Snippets
        use {
            "L3MON4D3/LuaSnip", -- Snippets plugin
            after = "nvim-cmp"
        }

        -- WEBDEV
        use "jiangmiao/auto-pairs"
        use "maxmellon/vim-jsx-pretty"
        use "mattn/emmet-vim"

        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            config = function()
                require "nvim-tree".setup {
                    actions = {
                        open_file = {
                            quit_on_open = true,
                            resize_window = true
                        }
                    }
                }
            end
        }

        -- GIT
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use "tpope/vim-fugitive" -- Git commands in nvi

        -- COMMENTS
		-- TODO: Look for new one
		use "terrortylor/nvim-comment"
		use 'JoosepAlviste/nvim-ts-context-commentstring'

        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }
    end
)

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
