local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

-- Do not close vim when the last buffer is closed
vim.api.nvim_create_autocmd("BufDelete", {
	callback = function()
		if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
			vim.cmd("enew") -- open a new empty buffer
		end
	end,
})
