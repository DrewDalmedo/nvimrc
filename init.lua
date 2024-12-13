-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- load lazy.nvim
require("drew.lazy")

local function telescope_installed()
    local ok, _ = pcall(require, "telescope")
    return ok
end

if telescope_installed() then
    vim.g.netrw_quiet = 1
    vim.g.netrw_fastbrowse = 0

    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
            local path = vim.fn.expand("%:p")
            if vim.fn.isdirectory(path) ~= 0 then
                -- schedule telescope to run after buffers are cleared
                vim.schedule(function()
                    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_valid(bufnr) then
                            vim.api.nvim_buf_delete(bufnr, { force = true })
                        end
                    end

                    -- open and focus telescope
                    require("telescope.builtin").find_files({
                        cwd = path,
                    })
                end)

                return true
            end
        end
    })
end

-- keybinds
require("drew.keybinds")

-- other misc settings
require("drew.options")
