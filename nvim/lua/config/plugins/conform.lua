return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "vp_fmt", "prettier", stop_after_first = true },
			typescript = { "vp_fmt", "prettier", stop_after_first = true },
			typescriptreact = { "vp_fmt", "prettier", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "goimports", "gofmt" },
			php = { "php-cs-fixer" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured
			["_"] = { "trim_whitespace" },
		},

		formatters = {
			vp_fmt = {
				command = "./node_modules/.bin/oxfmt",
				args = { "--stdin-filepath", "$FILENAME" },
				stdin = true,
			},
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
