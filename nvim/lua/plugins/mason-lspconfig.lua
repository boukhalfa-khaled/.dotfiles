local opts = {
	ensure_installed = {
		"efm", -- to set linters and formaters
		"lua_ls", -- lua
		"phpactor", -- php
		"css_variables", -- (keywords: css, scss, less)
		"unocss", --(keywords: css)
		"emmet_ls", -- (keywords: emmet)
		"eslint", -- (keywords: javascript, typescript)
		"html", -- (keywords: html)
		"intelephense", -- (keywords: php)
		"lua_ls", -- (keywords: lua)
		"phpactor", -- (keywords: php)
		"pyright", -- (keywords: python)
		"quick_lint_js", -- (keywords: javascript, typescript)
		"stimulus_ls", -- (keywords: blade, html, php, ruby)
		"tsserver", -- (keywords: typescript, javascript)
	},
	automatic_installation = true,
}
return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = { "williamboman/mason.nvim" },
}
