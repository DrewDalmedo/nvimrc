return {
  "NeogitOrg/neogit",

  enabled = true,

  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    "nvim-telescope/telescope.nvim", -- optional
  },

  config = function()
      local neogit = require("neogit")

      -- configure neogit
      neogit.setup({})

      -- keybind
      vim.keymap.set("n", "<leader>mg", function()
        neogit.open()
      end)
  end
}
