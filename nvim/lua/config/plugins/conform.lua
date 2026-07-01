return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "oxfmt", "prettier", stop_after_first = true },
			typescript = { "oxfmt", "prettier", stop_after_first = true },
			typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "goimports", "gofmt" },
			php = { "php-cs-fixer" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured
			["_"] = { "trim_whitespace" },
		},

		formatters = {
			-- Some projects (vite-plus / `vp`) ship an LSP-only stub at
			-- node_modules/.bin/oxfmt that refuses stdin formatting. Prefer the
			-- real oxfmt binary in node_modules, then fall back to mason/global.
			oxfmt = {
				command = function(_, ctx)
					local nm = vim.fs.find("node_modules", {
						path = ctx.dirname,
						upward = true,
						type = "directory",
					})[1]
					if nm then
						local real = nm .. "/oxfmt/bin/oxfmt"
						if vim.fn.executable(real) == 1 then
							return real
						end
					end
					return "oxfmt"
				end,
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
		format_on_save = { timeout_ms = 2000 },
	},
	init = function()
		--
	end,
}
