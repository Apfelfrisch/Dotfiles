return {
  'akinsho/toggleterm.nvim',
  keys = {
    { '<F1>', ':ToggleTerm<CR>' },
    { '<F1>', '<Esc><Cmd>:ToggleTerm<CR>', mode = 't' },
  },
  config = true,
  lazy = false,
  opts = {
    size = 15,
  }
}
