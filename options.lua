vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = false

if vim.g.goneovim then
  vim.o.guifont = "UbuntuMono Nerd Font:h18"
end

-- if on windows, set the default shell from cmd.exe to powershell
if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'powershell'
    vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellquote = ''
    vim.opt.shellxquote = ''
end

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
