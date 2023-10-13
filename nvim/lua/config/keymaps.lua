-- Space is my leader.
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Clear search highlighting.
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><CR>')

-- Dont Jump on * search
vim.keymap.set('n', '*', [[:let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>]])

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')
vim.keymap.set('i', '{{', '<Esc>A {}<Esc>i')

-- Easier window navigation
vim.keymap.set('n', '<C-Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>')

-- Easier window resize
vim.keymap.set('n', '<S-Right>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<S-Left>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<S-Up>', ':resize -5<CR>')
vim.keymap.set('n', '<S-Down>', ':resize +5<CR>')
