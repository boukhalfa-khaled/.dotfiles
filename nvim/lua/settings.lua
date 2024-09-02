vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.incsearch = true
-- vim.opt.scrolloff = 999
vim.opt.colorcolumn = "89"
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("InvertedVisualSelection", { clear = true }),
	command = "highlight Visual guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE gui=reverse",
})
vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
