return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "goimports", "gofmt" },
			php = { "php-cs-fixer" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured
			["_"] = { "trim_whitespace" },
		},

		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--rules=@PER-CS2.0",
					"$FILENAME",
				},
				stdin = false,
			},
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
	},
	init = function()
		--
	end,
}
