return {
	'saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		'hrsh7th/nvim-cmp',
	},
	version = '1.*',
	opts = {
		source = {
			default = {'lsp', 'path', 'snippets', 'buffer', 'cmdline'},
		},
		keymap = {
			preset = 'enter',
			-- preset = 'default',

			-- ['<C-p>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
			-- ['<A-p>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		},

		completion = {
			menu = {
			    --[[
				draw = {
					columns = { { 'item_idx' }, { 'label', 'label_description', gap = 1 } },
					components = {
						item_idx = {
							text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
							highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
						}
					}
				},
				--]]
			},

			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},

			documentation = { auto_show = true}
		},
	},
}
