local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>y", '"*y', opts)
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>:source ~/.config/nvim/init.lua <CR>", opts)
