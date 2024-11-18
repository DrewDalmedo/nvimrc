return {
  "sainnhe/gruvbox-material",
  enabled = true,
  config = function()
    if vim.g.goneovim then          -- if in gui use the color theme
      vim.opt.termguicolors = true
      vim.cmd([[ color gruvbox-material ]])
    else
      vim.opt.termguicolors = false -- use terminal theme
    end

  end
}
