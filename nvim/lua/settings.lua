vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.fileencoding = "utf-8"
vim.opt.wrap = true
vim.opt.incsearch = true
-- vim.opt.updatetime = 100 --set faster completion
--vim.opt.mouse = 'r'
--vim.opt.scrolloff = 999
vim.opt.colorcolumn = "89"
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("InvertedVisualSelection", { clear = true }),
	command = "highlight Visual guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE gui=reverse",
})
vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

vim.diagnostic.setloclist({ open = false })

