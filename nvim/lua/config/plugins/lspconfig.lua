return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'b0o/schemastore.nvim', --Schemastore Plugin for lspconfig (Json)
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- PHP
    require('lspconfig').intelephense.setup({
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
          end,
        },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities,
      filetypes = { 'php', 'blade' },
    })

    -- Typescript
    require('lspconfig').ts_ls.setup{
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        completions = {
          completeFunctionCalls = true
        }
      }
    }

    -- Golang
    require("lspconfig").gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          gofumpt = true,
          usePlaceholders = true,
        },
      },
      capabilities = capabilities,
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl'},
    })

    -- require('lspconfig').phpactor.setup({
    --   capabilities = capabilities,
    --   on_attach = function(client, bufnr)
    --     client.server_capabilities.completionProvider = false
    --     client.server_capabilities.hoverProvider = false
    --     client.server_capabilities.implementationProvider = false
    --     client.server_capabilities.referencesProvider = false
    --     client.server_capabilities.renameProvider = false
    --     client.server_capabilities.selectionRangeProvider = false
    --     client.server_capabilities.signatureHelpProvider = false
    --     client.server_capabilities.typeDefinitionProvider = false
    --     client.server_capabilities.workspaceSymbolProvider = false
    --     client.server_capabilities.definitionProvider = false
    --     client.server_capabilities.documentHighlightProvider = false
    --     client.server_capabilities.documentSymbolProvider = false
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.server_capabilities.documentRangeFormattingProvider = false
    --   end,
    --   init_options = {
    --     ["language_server_phpstan.enabled"] = false,
    --     ["language_server_psalm.enabled"] = false,
    --   },
    --   handlers = {
    --     ['textDocument/publishDiagnostics'] = function() end
    --   }
    -- })

    -- Tailwind CSS
    require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

    -- JSON
    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- Keymaps
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
    vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Commands
    vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      },
      signs = {
          text = {
              [vim.diagnostic.severity.ERROR] = '✘',
              [vim.diagnostic.severity.WARN] = '‼',
              [vim.diagnostic.severity.INFO] = '✦',
              [vim.diagnostic.severity.HINT] = '➤',
          },
      },
    })
  end,
}
