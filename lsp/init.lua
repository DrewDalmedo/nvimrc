local M = {}

-- lsp configuration
require("drew.lsp.config")

-- load lsps
local providers = require("drew.lsp.providers")
require("drew.lsp.loader").load(providers)

return M
