vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>h", ":noh<LF>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})
--map <C-j> :cn<CR>
--map <C-k> :cp<CR>

--vim.keymap.set({ "n", "v" }, "<leader>q", ":copen<LF>")
--vim.keymap.set({ "n", "v" }, "<leader>Q", ":cclose<LF>")

-- Function to toggle the quickfix list
local function toggle_quickfix()
	if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

vim.keymap.set({ "n", "v" }, "<leader>v", toggle_quickfix)
