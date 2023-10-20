return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>t', ':TestNearest<CR>' },
    { '<Leader>T', ':TestSuite<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  config = function()
    vim.cmd([[
      let test#php#phpunit#executable = ' composer test --'
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      let g:test#strategy = 'toggleterm'
    ]])
  end
}
