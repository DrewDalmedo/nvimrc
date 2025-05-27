return {
    "junegunn/goyo.vim",
    enabled = true,
    config = function()
        vim.keymap.set("n", "<leader>go", "<cmd>Goyo<cr>")
    end
}
