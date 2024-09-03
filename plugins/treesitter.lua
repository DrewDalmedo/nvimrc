return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  opts = {
    -- TODO: Install C++ plugin
    ensure_installed = { "c", "lua" },
  },
  build = ":TSUpdate",
}
