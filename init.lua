-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- general settings
require("drew.options")

-- keybinds
require("drew.keybinds")

-- graphical client configuration
require("drew.graphical")

-- load lsp
require("drew.lsp")

-- load lazy.nvim
require("drew.lazy")

