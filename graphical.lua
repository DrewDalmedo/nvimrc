-- universal
vim.o.guifont = "UbuntuMono Nerd Font:h22"

-- neovide specific settings
if vim.g.neovide ~= nil then
  -- toggle fullscreen with F11
  vim.api.nvim_set_keymap('n', '<F11>', [[<Cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>]], { noremap = true, silent = true })

  -- live resizing
  vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { noremap = true, silent = true })
end

