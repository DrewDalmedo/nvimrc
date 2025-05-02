vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = false

if vim.g.neovide then
  vim.o.guifont = "UbuntuMono Nerd Font:h18"
  vim.opt.termguicolors = true
  vim.cmd([[ color gruvbox-material ]])
  -- Toggle fullscreen with F11 in Neovide
  vim.api.nvim_set_keymap('n', '<F11>', [[<Cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>]], { noremap = true, silent = true })
end

-- if on Windows, set the default shell from cmd.exe to bash
if vim.fn.has('win32') == 1 then
    vim.opt.shell = 'bash'
    vim.opt.shellcmdflag = '--login -i'
    vim.opt.shellxquote = ''
end

-- enable relative line numbers in Netrw
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = true
    end
})

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
