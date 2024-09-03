-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- load lazy.nvim
require("drew.lazy")

-- flutter-tools setup
--require("flutter-tools").setup({})
--require("telescope").load_extension("flutter")

-- keybinds
require("drew.keybinds")

-- other misc settings
require("drew.options")
