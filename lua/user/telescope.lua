local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end
telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules"
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
