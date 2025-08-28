return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "zbirenbaum/copilot.lua", suggestion = { enabled = false } },
	},
	opts = {
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
}
