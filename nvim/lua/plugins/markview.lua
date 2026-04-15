return {
	"OXY2DEV/markview.nvim",
	ft = { "markdown", "quarto", "rmd", "typst" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-web-devicons",
	},
	opts = {
		preview = {
			icon_provider = "devicons",
		},

		hybrid_modes = { "n", "i" },

		markdown = {
			headings = {
				enable = true,
				shift_width = 0,
				heading_1 = { style = "label" },
				heading_2 = { style = "label" },
				heading_3 = { style = "icon" },
				heading_4 = { style = "simple" },
				heading_5 = { style = "simple" },
				heading_6 = { style = "simple" },
			},

			horizontal_rules = { enable = true },

			code_blocks = {
				enable = true,
				style = "language",
				pad_amount = 1,
			},

			block_quotes = { enable = true },

			list_items = {
				enable = true,
				indent_size = 2,
			},

			checkbox = { enable = true },

			tables = {
				enable = true,
				cell_padding = 2,
			},

			links = { enable = true },
			emails = { enable = true },
			inline_codes = { enable = true },
			emphasis = { enable = true },
			strikethrough = { enable = true },
			footnotes = { enable = true },
			tags = { enable = true },
		},

		latex = { enable = true },
		modes = { "n", "i", "no", "c" },
		max_file_length = 4000,
	},
	config = function(_, opts)
		require("markview").setup(opts)
	end,
}
