local status_ok, telescope = pcall(require, "telescope")



if not status_ok then
  return
end
telescope.setup {
    defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
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

M.search_dotfiles = function ()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		hidden = true,
	})

end

return M
