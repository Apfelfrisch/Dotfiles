return {
  'jlanzarotta/bufexplorer',
  config = function()
    vim.keymap.set('', '<C-b>', ':ToggleBufExplorer<CR>')
  end,
}
