return {
	"olimorris/codecompanion.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "zbirenbaum/copilot.lua", suggestion = { enabled = false } },
	},
	opts = {
		log_level = "DEBUG", -- or "TRACE"
	},
	keys = {
		{ "<Leader>ccc", "<cmd>CodeCompanionChat<CR>", desc = "Code Companion: Chat" },
	},
	config = function()
		require("codecompanion").setup({
			prompt_library = {
				["Fix phpstan errors"] = {
					strategy = "workflow",
					description = "Use a workflow to fix phpstan errors",
					opts = {
						index = 5,
						is_default = true,
						short_name = "phpstan",
					},
					prompts = {
						{
							{
								name = "Fix phpstan errors",
								role = "user",
								opts = { auto_submit = false },
								content = function()
									vim.g.codecompanion_yolo_mode = true
									return [[
### Instructions

			You are tasked with checking the current PHP buffer using **PHPStan** and fixing all errors or warnings it reports.
			You must iteratively correct the code until `phpstan` reports **no errors** for the file.
			Keep code clean and PSR-12 compliant while preserving logic and functionality.

### Steps to Follow

			1. Update the code in #{buffer} using the @{insert_edit_into_file} tool
			2. Run PHPStan for the current buffer using the command:
			   `bash phpstan analyse #{buffer} --no-progress --error-format=raw`
			3. Make sure you trigger both tools in the same response]]
								end,
							},
						},
						-- {
						-- 	{
						-- 		name = "Repeat On Failure",
						-- 		role = "user",
						-- 		opts = { auto_submit = true },
						-- 		condition = function()
						-- 			return vim.g.codecompanion_current_tool == "cmd_runner"
						-- 		end,
						-- 		-- Repeat until the tests pass, as indicated by the testing flag
						-- 		-- which the cmd_runner tool sets on the chat buffer
						-- 		repeat_until = function(chat)
						-- 			return chat.tool_registry.flags.testing == true
						-- 		end,
						-- 		content = "The tests have failed. Can you edit the buffer and run the test suite again?",
						-- 	},
						-- },
					},
				},
			},
		})
	end,
}
