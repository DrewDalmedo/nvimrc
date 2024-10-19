vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- telescope
teleBuiltins = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", teleBuiltins.find_files, {})
vim.keymap.set("n", "<leader>fg", teleBuiltins.live_grep, {})
vim.keymap.set("n", "<leader>fm", teleBuiltins.man_pages, {})

-- compile current directory
--vim.keymap.set("n", "<leader>cc", "<cmd>!compiler %:p<cr>")

--vim.keymap.set("n", "<leader>mg", function()
--  require("neogit").open()
--end)

-- terminal
vim.keymap.set("n", "<leader>pt", vim.cmd.term)
vim.keymap.set("t", "<leader>dt", "<C-\\><C-n><CR>")

-- preview
--vim.keymap.set("n", "<leader>pp", "<cmd>!sent '%'<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>cd %:p:h<cr>")    -- set current file directory as working directory
vim.keymap.set("n", "<leader>ch", "<cmd>cd ~<cr>")        -- set home directory as working directory

vim.keymap.set("n", "<leader>nv", "<cmd>noh<cr>")        -- set home directory as working directory

