local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
luasnip.config.setup({
  history = true,
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Use <C-b/f> to scroll the docs
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- Use <C-k/j> to switch in items
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),

		-- Open Completion
		["<C-Space>"] = cmp.mapping.complete({}),

		-- Use <CR>(Enter) to confirm selection
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }), -- i - insert mode; s - select mode
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	formatting = {
		fields = { "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "",
				luasnip = "[Snippet]",
				buffer = "[File]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "luasnip" }, -- For luasnip user
		{ name = "buffer" }, -- For buffer word completion
		{ name = "path" }, -- For path completion
	}),
})

cmp.event:on("menu_opened", function()
	vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
	vim.b.copilot_suggestion_hidden = false
end)
