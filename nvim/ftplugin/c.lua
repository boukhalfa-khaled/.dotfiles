vim.cmd("compiler c")

local Compile = function()
	vim.cmd("w")
	vim.cmd("cd %:p:h")
	vim.cmd("silent make")
	vim.cmd("cd -")
	vim.cmd("cwindow")
end

local Run = function()
	vim.cmd("!%:p:r")
end

vim.keymap.set("n", "<leader>c", Compile, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", Run, { noremap = true })
