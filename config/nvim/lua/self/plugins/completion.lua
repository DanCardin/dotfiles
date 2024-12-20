return {
	{
		'saghen/blink.cmp',
		lazy = false,
		dependencies = {
			'rafamadriz/friendly-snippets',
			"giuxtaposition/blink-cmp-copilot",
		},
		version = 'v0.*',
		opts = {
			keymap = {
				preset = 'enter',
				['<Tab>'] = { 'select_next', 'fallback' },
				['<S-Tab>'] = { 'select_prev', 'fallback' },
			},
			cmdline = { preset = 'enter' },
			appearance = {
				use_nvim_cmp_as_default = true,
				-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
				kind_icons = {
					Copilot = "",
					Text = '󰉿',
					Method = '󰊕',
					Function = '󰊕',
					Constructor = '󰒓',

					Field = '󰜢',
					Variable = '󰆦',
					Property = '󰖷',

					Class = '󱡠',
					Interface = '󱡠',
					Struct = '󱡠',
					Module = '󰅩',

					Unit = '󰪚',
					Value = '󰦨',
					Enum = '󰦨',
					EnumMember = '󰦨',

					Keyword = '󰻾',
					Constant = '󰏿',

					Snippet = '󱄽',
					Color = '󰏘',
					File = '󰈔',
					Reference = '󰬲',
					Folder = '󰉋',
					Event = '󱐋',
					Operator = '󰪚',
					TypeParameter = '󰬛',
				},
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
			},
			signature = { enabled = true },
			completion = {
				list = {
					selection = 'manual',
				},
				menu = {
					border = 'padded',
					winblend = 25
				},
				documentation = {
					auto_show = true
				},
				ghost_text = {
					enabled = false,
				},
			}
		},
		opts_extend = { "sources.default" }
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"giuxtaposition/blink-cmp-copilot",
		after = { "copilot.lua" },
	}
}
