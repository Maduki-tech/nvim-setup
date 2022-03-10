local opts = {noremap = true, silent = true}
-------- GENERAL KEYBOARD SHORTCUTS -----------

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>y", [["*y]], {})

-- Basic window Movement
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>:vsplit <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>:wincmd h <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>:wincmd j <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>:wincmd k <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>:wincmd l <CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "Q", "<cmd>:x <CR>", {noremap = true, silent = true})

-- GIT KEYMAPS
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>:G<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>:Git push<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>:diffget //3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>:diffget //2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>:NvimTreeToggle <CR>", {})

-- Window resizing
vim.api.nvim_set_keymap("n", "<leader>+", "<cmd>:wincmd + <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>-", "<cmd>:wincmd - <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>.", "<cmd>:vertical resize +5<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>,", "<cmd>:vertical resize -5<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>:wincmd = <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Neoformat <CR>", {})
vim.api.nvim_set_keymap("n", "<leader>y", '"*y', opts)
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>:source ~/.config/nvim/init.lua <CR>", opts)
