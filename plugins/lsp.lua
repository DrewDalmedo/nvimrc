-- Check out williamboman/mason-lspconfig.nvim for more details
-- on how to configure these LSPs.
return {
  "neovim/nvim-lspconfig",

  enabled = false,

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    mason = require("mason")
    masonLspconfig = require("mason-lspconfig")

    mason.setup()
    masonLspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "gopls",
        "pylsp",
      },
    })

    -- set up language servers
    require("lspconfig").lua_ls.setup({})
    require("lspconfig").rust_analyzer.setup({}) -- requires rust_analyzer binary
    require("lspconfig").clangd.setup({})
    require("lspconfig").gopls.setup({})         -- requires gopls binary
    require("lspconfig").pylsp.setup({})
  end,
}
