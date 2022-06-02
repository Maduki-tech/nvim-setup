local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- AUTO INSTALL PACKER WHEN IT IS NOT ON THE PC
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local use = require("packer").use
require("packer").startup(
    function()
        use "wbthomason/packer.nvim" -- Package manager
		use "sainnhe/gruvbox-material"
		use "gruvbox-community/gruvbox" -- Best Color Ever
		use "joshdick/onedark.vim"
		use "folke/tokyonight.nvim"
        use "itchyny/lightline.vim" -- Fancier statusline
        use "lukas-reineke/indent-blankline.nvim" -- Delete all the Blank lines
        -- Telescope Requirements
        use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        -- Treesitter
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "nvim-treesitter/playground"
        use "sbdchd/neoformat" -- formatting the text

        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp"
        use "epilande/vim-react-snippets" -- react Snippets

        -- WEBDEV
        use "jiangmiao/auto-pairs"
        use "maxmellon/vim-jsx-pretty"
        use "mattn/emmet-vim"
        -- cmp plugins
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        use "saadparwaiz1/cmp_luasnip" -- snippet completions
		use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

        -- snippets
        use "L3MON4D3/LuaSnip" --snippet engine
        use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

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
        use "terrortylor/nvim-comment"
        use "JoosepAlviste/nvim-ts-context-commentstring"

        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }
        use {"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"}

        use(
            {
                "iamcco/markdown-preview.nvim",
                run = "cd app && npm install",
                setup = function()
                    vim.g.mkdp_filetypes = {"markdown"}
                end,
                ft = {"markdown"}
            }
        )
    end
)
