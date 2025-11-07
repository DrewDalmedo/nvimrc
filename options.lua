vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.autoindent = true -- on by default in nvim, good to explicitly enable anyways
vim.opt.smartindent = true

vim.opt.termguicolors = true

-- allow project-level configurations
vim.opt.exrc = true

vim.o.showtabline = 1  -- Always show tabline (0=never, 1=if multiple tabs, 2=always)
vim.o.tabline = '%!v:lua.Tabline()'

function _G.Tabline()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local tabnum = tostring(i)
    local label = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
    local hl = i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#'
    s = s .. hl .. ' ' .. tabnum .. ': ' .. label .. ' '
  end
  s = s .. '%#TabLineFill#'
  return s
end

-- if on Windows and bash is installed, set the default shell from cmd.exe to bash
if vim.fn.has('win32') == 1 and vim.fn.executable('bash') == 1 then
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

-- always only show the help window
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("only")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    vim.cmd("only")
  end,
})

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
