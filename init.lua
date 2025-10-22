-- general settings
require("drew.options")

-- keybinds
require("drew.keybinds")

-- graphical client configuration
require("drew.graphical")

-- load lsp
if vim.fn.has("nvim-0.11") == 1 then
  require("drew.lsp")
end

-- load lazy.nvim
require("drew.lazy")

