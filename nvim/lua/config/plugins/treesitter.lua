return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['if'] = '@function.inner',
            ['af'] = '@function.outer',
            ['ia'] = '@parameter.inner',
            ['aa'] = '@parameter.outer',
          },
        },
      },
      auto_install = true,
      ensure_installed = {
        'arduino',
        'bash',
        'comment',
        'css',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'html',
        'http',
        'ini',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'make',
        'markdown',
        'passwd',
        'php',
        'phpdoc',
        'python',
        'regex',
        'ruby',
        'rust',
        'sql',
        'svelte',
        'typescript',
        'vim',
        'vue',
        'xml',
        'yaml',
      },
    }
  end,
}
