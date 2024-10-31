local Run = function()
	vim.cmd("w")
	vim.cmd("!echo '======='");
	vim.cmd("!php %")
end

vim.keymap.set("n", "<leader>r", Run, { noremap = true })
