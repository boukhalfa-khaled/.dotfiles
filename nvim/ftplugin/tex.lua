vim.cmd("compiler tex")

local Compile = function()
	vim.cmd("w")
	vim.cmd("cd %:p:h")
	vim.cmd("silent make")
	vim.cmd("cd -")
	vim.cmd("cwindow")
end

local function Run()
	local opta = "--synctex-forward"
	local optb = vim.fn.line(".") .. ":" .. vim.fn.col(".") .. ":" .. vim.fn.expand("%:p")
	local pdf_path = vim.fn.expand("%:p:r") .. ".pdf"
	-- Construct the full command
	local command = string.format("silent !zathura '%s' %s %s  & disown", pdf_path, opta, optb)
	-- Execute the command
	vim.cmd(command)
end

vim.keymap.set("n", "<leader>c", Compile, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", Run, { noremap = true })
