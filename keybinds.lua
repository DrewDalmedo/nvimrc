vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- telescope
teleBuiltins = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", teleBuiltins.find_files, {})
vim.keymap.set("n", "<leader>fg", teleBuiltins.live_grep, {})

-- compile current directory
--vim.keymap.set("n", "<leader>cc", "<cmd>!compiler %:p<cr>")

--vim.keymap.set("n", "<leader>mg", function()
--  require("neogit").open()
--end)

-- terminal
vim.keymap.set("n", "<leader>pt", vim.cmd.term)
vim.keymap.set("t", "<leader>dt", "<C-\\><C-n><CR>")

-- preview
vim.keymap.set("n", "<leader>pp", "<cmd>!sent '%'<cr>")
