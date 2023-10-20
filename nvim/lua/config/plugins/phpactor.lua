return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  keys = {
    { '<Leader>pm', ':PhpactorContextMenu<CR>' },
    { '<Leader>cf', ':PhpactorClassNew<CR>' },
    { '<Leader>mf', ':PhpactorMoveFile<CR>' },
    { '<Leader>em', ':\'<,\'>PhpactorExtractMethod<CR>', mode = 'v' },
    { '<Leader>nu', ':<C-u>PhpactorImportClass<CR>' },
    { '<Leader>ne', ':<C-u>PhpactorClassExpand<CR>' },
  },
}
