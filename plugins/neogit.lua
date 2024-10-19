return {
  "NeogitOrg/neogit",

  enabled = true,

  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    "nvim-telescope/telescope.nvim", -- optional
  },

  config = true,

  vim.keymap.set("n", "<leader>mg", function()
    require("neogit").open()
  end),
}
