-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- general settings
require("drew.options")

-- keybinds
require("drew.keybinds")

-- load lazy.nvim
require("drew.lazy")

