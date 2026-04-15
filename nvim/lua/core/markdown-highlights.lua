vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local set = vim.api.nvim_set_hl

		-- Headings should feel prominent but still cohesive
		set(0, "@markup.heading.1.markdown", { bold = true })
		set(0, "@markup.heading.2.markdown", { bold = true })
		set(0, "@markup.heading.3.markdown", { bold = true })
		set(0, "@markup.heading.4.markdown", { bold = true })
		set(0, "@markup.heading.5.markdown", { bold = true })
		set(0, "@markup.heading.6.markdown", { bold = true })

		-- Clean emphasis
		set(0, "@markup.bold.markdown", { bold = true })
		set(0, "@markup.italic.markdown", { italic = true })
		set(0, "@markup.strikethrough.markdown", { strikethrough = true })

		-- Links: readable, not loud
		set(0, "@markup.link.url.markdown_inline", { underline = true })
		set(0, "@markup.link.label.markdown_inline", { bold = true })

		-- Quotes: subtle and elegant
		set(0, "@markup.quote.markdown", { italic = true })

		-- Raw code: keep it warm and distinct
		set(0, "@markup.raw.markdown_inline", { bold = true })
		set(0, "@markup.raw.block.markdown", { bold = true })

		-- Punctuation should fade back
		set(0, "@punctuation.special.markdown", { link = "Comment" })
	end,
})
