-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color scheme
  { import = 'config.plugins.material' },

  -- Commenting support.
  { import = 'config.plugins.vim-commentary' },

  -- Pairs of handy bracket mappings, like [b and ]b.
  { 'tpope/vim-unimpaired' },

  -- Automatically fix indentation when pasting code.
  { import = 'config.plugins.vim-pasta' },

  -- Enable * searching with visually selected text.
  { 'nelstrom/vim-visual-star-search' },

  -- Indent autodetection with editorconfig support.
  { 'tpope/vim-sleuth' },

  -- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },

  -- Multi-file search and replace (:ack pattern : acks /patten/replace/gc)
  { 'wincent/ferret' },

  -- Fuzzy finder (sudo apt install ripgrep for infile search)
  { import = 'config.plugins.telescope' },

  -- File tree sidebar
  { import = 'config.plugins.nvim-tree' },

  -- A Status line.
  { import = 'config.plugins.lualine' },

  -- All closing buffers without closing the slit window.
   { import = 'config.plugins.bufdelete' },

  -- All closing buffers without closing the split window.
  { import = 'config.plugins.bufexplorer' },

  -- Improved syntax highlighting
  { import = 'config.plugins.treesitter' },

  -- Git commands.
  { 'tpope/vim-fugitive' },

  -- Terminal Window.
  { import = 'config.plugins.toggleterm' },

  -- Language Server Protocol.
  { import = 'config.plugins.lspconfig' },

  -- Completion
  { import = 'config.plugins.cmp' },

  -- Debugging
  { import = 'config.plugins.nvim-dap' },

  -- Testing helper
  { import = 'config.plugins.vim-test' },

  -- PHP Refactoring Tools
  { import = 'config.plugins.phpactor' },

  -- Syntax for Blade files
  { import = 'config.plugins.vim-blade' },

  --  Base rust functionallity
  { import = 'config.plugins.rust' },

  -- Better Rust tooling like Lsp-Config / debugger
  { import = 'config.plugins.rust-tools' },

  -- Display buffers as tabs.
  -- { import = 'config.plugins.bufferline' },

  -- Display indentation lines.
  -- { import = 'config.plugins.indent-blankline' },

  -- Git integration.
  -- { import = 'config.plugins.gitsigns' },

  -- Project Configuration.
  -- { import = 'config.plugins.projectionist' },

  -- Add, change, and delete surrounding text.
  -- { 'tpope/vim-surround' },

  -- Useful commands like :Rename and :SudoWrite.
  --  { 'tpope/vim-eunuch' },

  -- Colorize Hex Codes
  -- { import = 'config.plugins.colorizer' },

  -- Add smooth scrolling to avoid jarring jumps
  -- { 'karb94/neoscroll.nvim', config = true },

  -- Split arrays and methods onto multiple lines, or join them back up.
  -- { import = 'config.plugins.splitjoin' },

  -- Allow plugins to enable repeating of commands.
  -- { 'tpope/vim-repeat' },

  -- Navigate seamlessly between Vim windows and Tmux panes.
  -- { 'christoomey/vim-tmux-navigator' },

  -- Jump to the last location when opening a file.
  -- { 'farmergreg/vim-lastplace' },

  -- Automatically create parent dirs when saving.
  -- { 'jessarcher/vim-heritage' },

  -- Text objects for HTML attributes.
  -- { 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user'  },

  -- Automatically set the working directory to the project root.
  -- { import = 'config.plugins.vim-rooter' },
})
