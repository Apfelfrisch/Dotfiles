local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])
