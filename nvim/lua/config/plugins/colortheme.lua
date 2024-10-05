return {
  'kaicataldo/material.vim',
  lazy = false,
  priority = 1000,
  config = function ()
    vim.cmd("colorscheme material")
    vim.cmd("let g:material_theme_style = 'palenight'")
  end,
}

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   lazy = false,
--   priority = 1000,
--   config = function ()
--     vim.cmd("colorscheme rose-pine-dawn")
--   end,
-- }
