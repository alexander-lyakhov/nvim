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
		keymap = { preset = 'enter' },
		completion = {
			menu = {
				draw = {
					columns = { { 'item_idx' }, { 'label', 'label_description', gap = 1 } },
					components = {
						item_idx = {
							text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
							highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
						}
					}
				}
			},
			documentation = { auto_show = true}
		},
	},
}
