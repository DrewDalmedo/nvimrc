return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope_builtin = require("telescope.builtin")
    local project_selector = require("drew.custom.project_selector")

    project_selector.setup()

    vim.keymap.set("n", "<leader>fl", telescope_builtin.find_files, {})
    vim.keymap.set("n", "<leader>fh", telescope_builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fm", telescope_builtin.man_pages, {})
    vim.keymap.set("n", "<leader>pd", project_selector.pick_project, { noremap = true, silent = true })
  end,
}
