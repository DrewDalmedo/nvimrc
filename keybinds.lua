local map = vim.keymap.set

vim.g.mapleader = " "

-- Netrw
-- TODO: set up universal registration of file browser command (Ex, Oil, etc)
-- map("n", "<leader>pf", vim.cmd.Ex)

-- Alternative to save / write
map({ "n", "v" }, "<C-;>", "<cmd>w<cr>")
vim.keymap.set("i", "<C-;>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false) -- return to normal mode
  vim.cmd("write")
end, { desc = "Save and return to Normal mode" })
-- exit terminal mode
map("t", "<C-;>", "<C-\\><C-n><cr>")

-- File previews
local preview = require("drew.custom.file_preview")

map("n", "<leader>pp", function()
  preview.run_preview()
end)

preview.register("python", vim.fn.has("win32") == 1 and "!python %:." or "!python3 %:.")
preview.register("go", "make")
preview.register("c", "make run")

-- Quick navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-h>", "<C-6>")

-- Move selected line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Working directory management
map("n", "<leader>cc", "<cmd>cd %:p:h<cr>") -- set current file directory as working directory
map("n", "<leader>ch", "<cmd>cd ~<cr>")     -- set home directory as working directory

-- Remove highlighting
map("n", "<leader>nv", "<cmd>noh<cr>")

-- Window bindings 
--map("n", "<C-q>", ":q<CR>")           -- close window

local maximized = false
map("n", "<leader>wm", function()
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
map("n", "<leader>w,", ":vertical resize -5<CR>") -- decrease width
map("n", "<leader>w.", ":vertical resize +5<CR>") -- increase width
map("n", "<leader>w-", ":resize -5<CR>")          -- decrease height
map("n", "<leader>w+", ":resize +5<CR>")          -- increase height

-- Tab bindings (<leader>t)
-- TODO: decide whether or not to keep these
--
map("n", "<leader>t", function()
  vim.cmd("tabnew")
  -- TODO: set up universal registration of file browser command (Ex, Oil, etc)
  --vim.cmd("Oil")
  vim.cmd("Telescope find_files")
end)

map("n", "<leader>e", function()
  vim.cmd("enew")
end)

map("n", "<C-j>", ":tabnext<CR>")     -- next tab (j for down/next)
map("n", "<C-k>", ":tabprevious<CR>") -- previous tab (k for up/prev)
-- map("n", "<leader>tf", ":tabfirst<CR>")    -- first tab
-- map("n", "<leader>te", ":tablast<CR>")     -- end (last) tab
map("n", "<C-S-j>", ":+tabmove<CR>")     -- move tab right
map("n", "<C-S-k>", ":-tabmove<CR>")     -- move tab left
-- 
-- Quick tab navigation with numbers
for i = 1, 9 do
  map("n", "<C-" .. i .. ">", i .. "gt") -- go to tab number i
end
