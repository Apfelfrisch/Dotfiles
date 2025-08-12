return {
	"phpactor/phpactor",
	lazy = true,
	build = "composer install --no-dev --optimize-autoloader",
	ft = "php",
	keys = {
		{ "<Leader>pm", ":PhpactorContextMenu<CR>" }, -- menu
		{ "<Leader>pt", ":PhpactorClassNew<CR>" }, -- touch
		{ "<Leader>pmf", ":PhpactorMoveFile<CR>" }, -- mv
		{ "<Leader>pcp", ":PhpactorCopyFile<CR>" }, --cp
		{ "<Leader>pem", ":'<,'>PhpactorExtractMethod<CR>", mode = "v" }, -- extend namespace
		{ "<Leader>pnu", ":<C-u>PhpactorImportClass<CR>" }, -- use namespace
		{ "<Leader>pne", ":<C-u>PhpactorClassExpand<CR>" },
		-- Deprecated
		{ "<Leader>nu", ":<C-u>PhpactorImportClass<CR>" },
		{ "<Leader>ne", ":<C-u>PhpactorClassExpand<CR>" },
	},
}
