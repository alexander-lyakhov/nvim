vim.api.nvim_set_hl(0, "HLMenu",    {})
vim.api.nvim_set_hl(0, "HLCursor",  { fg = '#ffffff', bg = '#008080' })
vim.api.nvim_set_hl(0, "HLDocs",  {})

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
			['<A-n>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		},

		completion = {
			menu = {
				border = 'single',
				winhighlight = 'Normal:HLMenu,FloatBorder:Conceal,CursorLine:BlinkCmpMenuSelection,Search:None',

				draw = {
					padding = 1,

					--[[columns = { { 'item_idx' }, { 'label', 'label_description', gap = 1 } },
					components = {
						item_idx = {
							text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
							highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
						}
					}--]]
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = 'single',
					-- winhighlight = 'Normal:HLDocs,FloatBorder:CursorLineFold,EndOfBuffer:WinSeparator,NormalFloat:NonText',
					winhighlight = 'Normal:HLDocs,FloatBorder:CursorLineFold,EndOfBuffer:WinSeparator,NormalFloat:CursorLineNr',
				}
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				}
			},

		},
	},
}
