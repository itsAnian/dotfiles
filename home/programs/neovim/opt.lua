vim.opt.nu = true
vim.opt.relativenumber = false


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.g.netrw_liststyle = 3

vim.opt.clipboard = "unnamedplus"

vim.filetype.add({
  extension = {
    cs = "c_sharp",
  },
})
