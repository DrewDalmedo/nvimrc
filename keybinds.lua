-- Netrw
-- TODO: set up universal registration of file browser command (Ex, Oil, etc)
-- vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- Alternative to save / write
vim.keymap.set({ "i", "n", "v" }, "<C-;>", "<cmd>w<cr>")
-- exit terminal mode
vim.keymap.set("t", "<C-;>", "<C-\\><C-n><cr>")

-- File previews
local preview = require("drew.custom.file_preview")

vim.keymap.set("n", "<leader>pp", function()
  preview.run_preview()
end)

preview.register("python", vim.fn.has("win32") == 1 and "!python %:." or "!python3 %:.")
preview.register("go", "make")

-- Quick navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-h>", "<C-6>")

-- Move selected line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Working directory management
vim.keymap.set("n", "<leader>cc", "<cmd>cd %:p:h<cr>") -- set current file directory as working directory
vim.keymap.set("n", "<leader>ch", "<cmd>cd ~<cr>")     -- set home directory as working directory

-- Remove highlighting
vim.keymap.set("n", "<leader>nv", "<cmd>noh<cr>")

-- Window bindings 
vim.keymap.set("n", "<C-q>", ":q<CR>")           -- close window

local maximized = false
vim.keymap.set("n", "<leader>wm", function()
  if maximized then
    vim.cmd("wincmd =")
    maximized = false
  else
    vim.cmd("wincmd |")
    vim.cmd("wincmd _")
    maximized = true
  end
end)

-- Resizing windows with easier shortcuts (since HHKB makes arrows harder to reach)
vim.keymap.set("n", "<leader>w,", ":vertical resize -5<CR>") -- decrease width
vim.keymap.set("n", "<leader>w.", ":vertical resize +5<CR>") -- increase width
vim.keymap.set("n", "<leader>w-", ":resize -5<CR>")          -- decrease height
vim.keymap.set("n", "<leader>w+", ":resize +5<CR>")          -- increase height

-- Tab bindings (<leader>t)
-- TODO: decide whether or not to keep these
--
-- vim.keymap.set("n", "<leader>t", function()
--   vim.cmd("tabnew")
--   -- TODO: set up universal registration of file browser command (Ex, Oil, etc)
--   vim.cmd("Oil")
-- end)
-- vim.keymap.set("n", "<leader>tj", ":tabnext<CR>")     -- next tab (j for down/next)
-- vim.keymap.set("n", "<leader>tk", ":tabprevious<CR>") -- previous tab (k for up/prev)
-- vim.keymap.set("n", "<leader>tq", ":tabclose<CR>")    -- close tab
-- vim.keymap.set("n", "<leader>tl", ":tabs<CR>")        -- list tabs
-- vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>")    -- first tab
-- vim.keymap.set("n", "<leader>te", ":tablast<CR>")     -- end (last) tab
-- vim.keymap.set("n", "<leader>tm", ":tabmove<CR>")     -- move tab
-- 
-- -- Quick tab navigation with numbers
-- for i = 1, 9 do
--   vim.keymap.set("n", "<leader>" .. i, i .. "gt") -- go to tab number i
-- end
