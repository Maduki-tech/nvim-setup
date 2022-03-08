-- LSP settings
local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
end
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'pyright', 'tsserver', 'arduino_language_server'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

require'lspconfig'.clangd.setup{}

-- Example custom server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized butunique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'


-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm{
			behavior = cmp.ConfirmBehavior.Relace,
			select = true,
		},
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}


--Enable (broadcasting) snippet capability for completion
--local htmlCapa = vim.lsp.protocol.make_client_capabilities()
--htmlCapa.textDocument.completion.completionItem.snippetSupport = true
--
--require'lspconfig'.html.setup {
--	capabilities = htmlCapa,
--}



require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.emmet_ls.setup{
	capabilities = capabilities,
	filetype = { 'html', 'css', 'tsx', 'jsx' };
	root_dir = function (fname)
		return vim.loop.cwd()
	end,
}

require'lspconfig'.gopls.setup{}

require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }

require'lspconfig'.bashls.setup{}

require'lspconfig'.dockerls.setup{}

require'lspconfig'.rust_analyzer.setup{}
