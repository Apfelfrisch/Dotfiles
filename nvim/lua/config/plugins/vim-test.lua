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
      let test#php#phpunit#executable = 'composer test --'
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' | less -R'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end
}
