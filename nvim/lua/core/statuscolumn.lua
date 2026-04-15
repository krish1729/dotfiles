local M = {}

function M.fold_icon()
	local lnum = vim.v.lnum

	if vim.fn.foldlevel(lnum) <= 0 then
		return " "
	end

	if lnum > 1 and vim.fn.foldlevel(lnum - 1) >= vim.fn.foldlevel(lnum) then
		return " "
	end

	if vim.fn.foldclosed(lnum) == -1 then
		return ""
	end

	return ""
end

function M.signs()
	local bufnr = vim.api.nvim_get_current_buf()
	local signs = vim.fn.sign_getplaced(bufnr, { group = "*" })[1]

	if not signs or not signs.signs then
		return " "
	end

	local lnum = vim.v.lnum
	for _, s in ipairs(signs.signs) do
		if s.lnum == lnum then
			return "│"
		end
	end

	return " "
end

function M.render()
	-- fold icon + sign column + line number, with enough spacing
	return table.concat({
		"%{%v:lua.require'core.statuscolumn'.fold_icon()%}",
		"%{%v:lua.require'core.statuscolumn'.signs()%}",
		" ",
		"%=",
		"%l",
		" ",
	}, "")
end

return M
