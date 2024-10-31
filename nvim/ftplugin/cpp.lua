vim.b.did_ftplugin = true

vim.cmd("compiler cpp")

local Compile = function()
	vim.cmd("w")
	vim.cmd("cd %:p:h")
	vim.cmd("silent make")
	vim.cmd("cd -")
	vim.cmd("cwindow")
end

local Run = function()
	vim.cmd("cd %:p:h")
	vim.cmd("! ./%:t:r")
	vim.cmd("cd -")
end

vim.keymap.set("n", "<leader>c", Compile)
vim.keymap.set("n", "<leader>r", Run)
--vim.keymap.set("n", "<leader>m", ":so /home/khaled/.config/nvim/ftplugin/c.lua<LF>")
