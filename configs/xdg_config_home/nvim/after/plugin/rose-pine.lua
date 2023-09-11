require('rose-pine').setup({
	variant = 'moon',
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = true,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},

	highlight_groups = {
        TelescopeBorder = { fg = 'pine' },
        TelescopeNormal = { bg = '_experimental_nc' },
        TelescopePromptBorder = { fg = 'gold' },
        TelescopePromptTitle = { fg = 'gold', },
        TelescopePreviewTitle = { fg = 'pine', },
        TelescopeResultsTitle = { fg = 'pine', },
	}
})

-- vim.cmd('colorscheme rose-pine')
