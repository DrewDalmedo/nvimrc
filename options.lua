vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

if vim.g.neovide then
  vim.o.guifont = "Source Code Pro:h18"
end

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
