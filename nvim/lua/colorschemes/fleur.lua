return {
	"aikhe/fleur.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			comments = { italic = true },
			keywords = { bold = true },
		},
		plugins = {
			telescope = true,
			-- Check on repo for other plugin support
		},
		on_colors = function(c)
			c.lily = "#FF79C6" -- Override color
		end,
	},
	config = function()
		vim.cmd("colorscheme fleur")
	end,
}
