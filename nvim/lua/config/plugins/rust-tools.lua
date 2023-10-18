return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  ft = 'rust',
  config = function()
    require('rust-tools').setup({
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    })
  end
}
