local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs
local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvim_lsp.default_capabilities()


	-- c/c++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportcompletions = true,
				},
			},
		},
	})
	-- typescript javascript, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"html",
		},
		init_options = {
			options = {
				["bem.enabled"] = true,
			},
		},
	})
	-- Css
	lspconfig.css_variables.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"css",
			"scss",
			"less",
		},
	})

	-- Tex files
	lspconfig.texlab.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"tex",
		},
	})

	lspconfig.textlsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"tex",
			"txt",
			"md",
		},
	})

	-- css
	lspconfig.unocss.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"css",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- typescript
	lspconfig.ts_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"typescript",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- php
	lspconfig.phpactor.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"php",
		},
	})

	-- html
	lspconfig.html.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"html",
			"blade",
		},
	})

	-- blade html php
	lspconfig.stimulus_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"blade",
		},
		root_dir = lspconfig.util.root_pattern("composer.json", "package.json", "tsconfig.json", "index.html", ".git"),
	})


	--icons
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	--lua
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	--python
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	--typescript
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier = require("efmls-configs.formatters.prettier")
	-- c/c++
	local clangformat = require("efmls-configs.formatters.clang_format")
	-- php
	local phpstan = require("efmls-configs.linters.phpstan")
	local phpcbf = require("efmls-configs.formatters.phpcbf")
	-- java
	local javaFormater = require("efmls-configs.formatters.google_java_format")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"typescript",
			"c",
			"cpp",
			"php",
			"html",
			"css",
			"java",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettier },
				c = { clangformat },
				cpp = { clangformat },
				php = { phpstan, phpcbf },
				html = { prettier },
				css = { prettier },
				java = { javaFormater },
			},
		},
	})

	-- format on Save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })
			if vim.tbl_isempty(efm) then
				return
			end
			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
		lazy = false,
		dependencies = {
			"windwp/nvim-autopairs",
			"willimboman/mason.nvim",
			"creativenull/efmls-configs-nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
