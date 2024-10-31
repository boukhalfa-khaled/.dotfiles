--enable keybinds only for when lsp server avaialbe

local keymap = vim.keymap
local M = {}
M.on_attach = function(client, bufnr)
	--keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	--	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<Leader>CA", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>gd", ":Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "gs", ":vsplit | Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<LF>", opts)
	keymap.set("n", "<leader>D", ":Lspsaga show_line_diagnostics<LF>", opts)
	keymap.set("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<LF>", opts)
	keymap.set("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<LF>", opts)
	if client.name == "pyright" then
		keymap.set("n", "<leader>oi", ":PyrightOrganizeImports<LF>", opts)
	end
end
return M
