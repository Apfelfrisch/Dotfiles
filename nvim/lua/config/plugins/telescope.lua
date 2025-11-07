return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		-- Find Files
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		-- Find grep
		{
			"<leader>fg",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
		},
		-- Find keymaps
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
		},
		-- Find Files
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })
			end,
		},
		-- Find history
		{
			"<leader>fh",
			function()
				require("telescope.builtin").oldfiles()
			end,
		},
		-- Find symboles
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
		},
		-- Find Files under cursor
		{
			"<leader>fu",
			function()
				local filename = vim.fn.expand("<cfile>")
				require("telescope.builtin").find_files({ default_text = filename })
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				path_display = { truncate = 1 },
				prompt_prefix = "   ",
				selection_caret = "  ",
				layout_config = {
					prompt_position = "top",
				},
				preview = {
					timeout = 200,
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-Down>"] = actions.cycle_history_next,
						["<C-j>"] = actions.move_selection_next,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-k>"] = actions.move_selection_previous,
						["<S-Tab>"] = actions.move_selection_previous,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = { ".git/" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					previewer = false,
					layout_config = {
						width = 80,
					},
				},
				oldfiles = {
					prompt_title = "History",
				},
				lsp_references = {
					previewer = false,
				},
				lsp_definitions = {
					previewer = false,
				},
				lsp_document_symbols = {
					symbol_width = 55,
				},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
