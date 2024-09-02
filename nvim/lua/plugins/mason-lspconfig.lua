local opts = {
	ensure_installed = {
		"efm", -- to set linters and formaters
		"lua_ls", -- lua
		"phpactor", -- php
		"black", -- python
		"clang", -- c / c++
		"clangd", -- c / c++
		"clang-format", -- (keywords: c, c#, c++, json, java, javascript)
		"css-lsp", -- cssls (keywords: css, scss, less)
		"css_variables", -- (keywords: css, scss, less)
		"unocss", --(keywords: css)
		"emmet_ls", -- (keywords: emmet)
		"eslint", -- (keywords: javascript, typescript)
		"eslint_d", -- (keywords: typescript, javascript)
		"flake8", -- (keywords: python)
		"html", -- (keywords: html)
		"intelephense", -- (keywords: php)
		"lua_ls", -- (keywords: lua)
		"luacheck", -- (keywords: lua)
		"phpactor", -- (keywords: php)
		"phpcbf", -- (keywords: php)
		"phpstan", -- (keywords: php)
		"prettier", -- (keywords: angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml)
		"prettierd", -- (keywords: angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml)
		"pyright", -- (keywords: python)
		"quick_lint_js", -- (keywords: javascript, typescript)
		"stimulus_ls", -- (keywords: blade, html, php, ruby)
		"stylua", --(keywords: lua, luau)
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
