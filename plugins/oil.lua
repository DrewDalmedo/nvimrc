return {
  'stevearc/oil.nvim',
  enabled = true,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["<C-h>"] = false,
      ["<CR>"] = function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()
        if not entry then return end

        local name = entry.name
        local path = oil.get_current_dir() .. name
        if name:match("%.pdf$") then
          -- open with zathura in background
          vim.fn.jobstart({ "open", path }, { detach = true })
        else
          -- fallback to default behavior
          oil.open(path)
        end
      end
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  },
  keys = {
    {
      "<leader>pf",
      "<cmd>Oil<cr>",
      mode = "",
      desc = "Open Oil",
    },
  },
  -- TODO: revisit after project selector has been rewritten
  --config = function()
  --  require("oil").setup()

  --  require("drew.custom.project_selector").setup({
  --    file_browser = "Oil"
  --  })
  --end,
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
