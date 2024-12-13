vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = false

if vim.g.goneovim then
  vim.o.guifont = "UbuntuMono Nerd Font:h18"
end

-- if on Windows, set the default shell from cmd.exe to bash
if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'bash'
    vim.opt.shellcmdflag = '--login -i'
    vim.opt.shellxquote = ''
end

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
