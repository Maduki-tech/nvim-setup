local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    return
end
telescope.setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " #",
        color_devicons = true,
        file_ignore_patterns = {
            "node_modules",
            ".git"
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            }
        }
    }
}

require("telescope").load_extension("fzy_native")

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
			cwd = "~/.config/nvim",
            hidden = true
        }
    )
end

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
    "<leader>so",
    [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>ft",
    [[:TodoTelescope<CR>]],
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fp",
    [[<cmd>lua require('telescope.builtin').builtin()<CR>]],
    {noremap = true, silent = true}
)
return M
