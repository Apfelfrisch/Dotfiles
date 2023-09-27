local separator = { '"▏"', color = 'StatusLineNonText' }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
    'kyazdani42/nvim-web-devicons',
  },
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      theme = {
        normal = {
          a = 'StatusLine',
          b = 'StatusLine',
          c = 'StatusLine',
        },
      },
    },
    sections = {
      lualine_a = {
        'mode',
        separator,
      },
      lualine_b = {
        'branch',
        'diff',
        separator,
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
        separator,
      },
      lualine_c = {
        'filename'
      },
      lualine_x = {
        'filetype',
        'encoding',
        'fileformat',
      },
      lualine_y = {
        separator,
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
        separator,
      },
      lualine_z = {
        'location',
        'progress',
      },
    },
  },
}
