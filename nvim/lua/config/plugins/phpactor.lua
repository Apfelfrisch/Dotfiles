return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  keys = {
    { '<Leader>pm', ':PhpactorContextMenu<CR>' },
    { '<Leader>pn', ':PhpactorClassNew<CR>' },
    { '<Leader>em', ':<C-u>PhpactorExtractMethod<CR>' },
    { '<Leader>nu', ':<C-u>PhpactorImportClass<CR>' },
    { '<Leader>ne', ':<C-u>PhpactorClassExpand<CR>' },
  },
}
