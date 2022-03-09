local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("user.setfile")
require("user.lsp-config")
require("user.keymap")
require("user.gitsigns")
require("user.treesitter")
require("user.telescope")
--require("user.nvim-tree")

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
        use "nvim-telescope/telescope-fzy-native.nvim"

        -- Treesitter
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "nvim-treesitter/playground"

        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp"
        use "L3MON4D3/LuaSnip" -- Snippets plugin

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
                    auto_close = true,
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
        use "sbdchd/neoformat" -- formatting the text

        -- COMMENTS
        use "https://github.com/tpope/vim-commentary.git"
    end
)

-------- GENERAL KEYBOARD SHORTCUTS -----------

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic window Movement
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>:vsplit <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>:wincmd h <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>:wincmd j <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>:wincmd k <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>:wincmd l <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "Q", "<cmd>:x <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', {noremap = true, silent = true})

-- GIT KEYMAPS
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>:G<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>:Git push<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>:diffget //3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>:diffget //2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>:NvimTreeToggle <CR>", {})
vim.api.nvim_set_keymap("v", "<leader>y", [["*y]], {})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})

-- Window resizing
vim.api.nvim_set_keymap("n", "<leader>+", "<cmd>:wincmd + <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>-", "<cmd>:wincmd - <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>.", "<cmd>:vertical resize +5<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>,", "<cmd>:vertical resize -5<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>:wincmd = <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Neoformat <CR>", {})

-- ADD Telescope shortcuts
-- IMPORTANT SHORTCUTS
vim.api.nvim_set_keymap(
    "n",
    "<leader><space>",
    [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fs",
    [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    [[<cmd>lua require('telescope.builtin').git_branches()<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fn",
    [[<cmd>lua require('user.telescope').search_dotfiles()<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fp",
    [[<cmd>lua require('telescope.builtin').builtin()<CR>]],
    {noremap = true, silent = true}
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
augroup trimWhiteSpace
autocmd!
autocmd BufWritePre * %s/\s\+$//e
augroup END
]]

-- CPP AUTO RUN
--vim.cmd [[
--autocmd vimEnter *.cpp nnoremap <C-r> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi<CR>
--]]

vim.cmd [[
autocmd vimEnter *.go nnoremap <C-r> :w <CR> :!go run . <CR>
]]

-- KEY BINDINGS

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leaer>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
vim.api.nvim_set_keymap(
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
)
vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- vim.api.nvset_et_keymr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
vim.api.nvim_set_keymap("n", "-d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "-D", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
vim.api.nvim_set_keymap("n", "<leader>z", [[<cmd> Format execute 'lua vim.lsp.buf.formatting()'<CR>]], opts)
