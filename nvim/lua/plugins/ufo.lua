return {
	{
		"kevinhwang91/promise-async",
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufReadPost",
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		end,
		opts = {
			provider_selector = function(_bufnr, _filetype, _buftype)
				return { "treesitter", "indent" }
			end,
		},
		config = function(_, opts)
			local ufo = require("ufo")
			ufo.setup(opts)

			-- Open/close all folds
			vim.keymap.set("n", "zO", ufo.openAllFolds, { desc = "Open all folds" })
			vim.keymap.set("n", "zC", ufo.closeAllFolds, { desc = "Close all folds" })

			-- Fold ONLY the current function/block under cursor
			vim.keymap.set("n", "zc", function()
				local lnum = vim.api.nvim_win_get_cursor(0)[1]
				vim.cmd(lnum .. "foldclose")
			end, { desc = "Close fold at cursor line" })

			-- Open ONLY the current function/block under cursor
			vim.keymap.set("n", "zo", function()
				local lnum = vim.api.nvim_win_get_cursor(0)[1]
				vim.cmd(lnum .. "foldopen")
			end, { desc = "Open fold at cursor line" })

			-- Peek folded text under cursor
			vim.keymap.set("n", "zp", function()
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "Peek fold (or hover)" })
		end,
	},
}
