---@type LSPProvider[]
return {
  require("drew.lsp.providers.gopls"),
  require("drew.lsp.providers.lua_ls"),
  require("drew.lsp.providers.clangd"),
  require("drew.lsp.providers.rust_analyzer"),
  require("drew.lsp.providers.pylsp"),
}
