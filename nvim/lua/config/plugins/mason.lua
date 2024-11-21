return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim', -- Mason Plugin for lspconfig with LSP-Server
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  opts = function()
    require('mason-lspconfig').setup({ automatic_installation = true })

    require('mason-tool-installer').setup({
      run_on_start = true,
      ensure_installed = {
        'eslint_d',
        'goimports',
        'gopls',
        'intelephense',
        'json-lsp',
        'lua-language-server',
        'php-cs-fixer',
        'phpactor',
        'prettier',
        'rust-analyzer',
        'tailwindcss-language-server',
        'ts_ls',
      }
    })
    end
}
