local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print "Error"
    return
end

local has_words_before = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ""):sub(cursor[2], cursor[2]):match(
        "%s"
    )
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print "Error"
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm {select = true},
        -- ["<Tab>"] = cmp.mapping(
        --     function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         elseif require("luasnip").expand_or_jumpable() then
        --             vim.fn.feedkeys(
        --                 vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
        --                 ""
        --             )
        --         elseif vim.b._copilot_suggestion ~= nil then
        --             vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn["copilot#Accept"](), true, true, true), "")
        --         else
        --             fallback()
        --         end
        --     end,
        --     {
        --         "i",
        --         "s"
        --     }
        -- ),
        -- ["<Tab>"] = cmp.mapping(
        --     function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         elseif luasnip.expandable() then
        --             luasnip.expand()
        --         elseif luasnip.expand_or_jumpable() then
        --             luasnip.expand_or_jump()
        --         elseif check_backspace() then
        --             fallback()
        --         else
        --             fallback()
        --         end
        --     end,
        --     {
        --         "i",
        --         "s"
        --     }
        -- ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            {
                "i",
                "s"
            }
        )
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)
            -- Kind icons
            --
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind], vim)
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu =
                ({
                -- cmp_tabnine = "[TN]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        -- {name = "cmp_tabnine"},
        {name = "nvim_lsp"},
        {name = "luasnip"},
        {name = "buffer"},
        {name = "path"}
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    window = {
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
        }
    },
    experimental = {
        ghost_text = false,
        native_menu = false
    }
}
