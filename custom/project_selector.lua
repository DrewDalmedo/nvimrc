-- requires the ldr utility from my personal scripts 
-- see https://github.com/DrewDalmedo/scripts
-- WILL NOT WORK ON WINDOWS (unless using some unix compat layer maybe)

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local M = {}

local function make_telescope_entry(raw)
    local default_entry_prefix = "Projects"
    local max_padding = 12  -- TODO: calculate padding based on max prefix length

    if type(raw) == "table" then
        -- assume table structure is 
        -- { 
            -- value = "/foo/bar",          (either the absolute path to a file or directory)
            -- directory = "/foo/bar",      (the (parent) directory)
            -- display = "bar",             (the name that's displayed by telescope)
            -- prefix = "FOO" or nil,       (the prefix to the name. optional, used for categorization)
            -- file = true or false         (whether value is a file or directory)
        -- }
        return {
            value       = raw.value,
            directory   = raw.file and vim.fn.fnamemodify(raw.value, ":h") or raw.value,
            display     = raw.prefix and raw.prefix .. ":" .. string.rep(" ", max_padding - string.len(raw.prefix)) .. raw.display or raw.display, 
            prefix      = raw.prefix or nil,
            ordinal     = raw.ordinal or raw.prefix .. ": " .. raw.display,
            file        = raw.file or false,
        }
    else
        -- raw is a string -> treat it as a fullpath from ldr
        local fullpath = raw
        
        -- use :t to get the tail (basename) of the absolute path
        local basename = vim.fn.fnamemodify(fullpath, ":t")
        return {
            value       = fullpath,
            directory   = fullpath,
            display     = default_entry_prefix .. ":" .. string.rep(" ", max_padding - string.len(default_entry_prefix)) .. basename,
            prefix      = default_entry_prefix or nil,                  -- useless, just for consistency
            ordinal     = default_entry_prefix .. ": " .. basename,
            file        = false,                                        -- assume output of ldr is only directories
        }
    end
end

-- run ldr, present its output as a telescope picker, then cd into the chosen path
M.ldr_cd = function(opts)
    opts = opts or {}
    
    -- TODO: This is terrible! Calling a script a user-defined PATH doesn't 
    --       work as expected in Neovide, so this hack works for now. Won't 
    --       work on other machines.
    --
    --       Do we even need an external script to select subdirectories 
    --       within a given project directory..?
    local ldr_cmd_path = "/Users/codec/tools/ldr"
    local ldr_lines = vim.fn.systemlist(ldr_cmd_path)

    local config_dir = vim.fn.stdpath("config") .. "/lua/drew"

    table.insert(ldr_lines, { value = config_dir, display = "Config", prefix = "NVIM" } )
    table.insert(ldr_lines, { value = config_dir .. "/options.lua", display = "Options", prefix = "NVIM", file = true })
    table.insert(ldr_lines, { value = config_dir .. "/keybinds.lua", display = "Keybinds", prefix = "NVIM", file = true })

    local all_entries = {} 
    for _, raw in ipairs(ldr_lines) do
        table.insert(all_entries, make_telescope_entry(raw))
    end

    pickers.new(opts, {
        prompt_title = "Projects",
        finder = finders.new_table {
            results = all_entries,
            entry_maker = function(entry)
                return entry
            end,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)

                local entry = action_state.get_selected_entry()
                if not entry or not entry.value then 
                    return
                end

                -- save all open and named buffers
                vim.cmd("wall")

                -- delete every buffer (including scratch / unnamed buffers)
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    -- force = true will kill even '[No Name]' (scratch) buffers
                    pcall(vim.api.nvim_buf_delete, buf, { force = true })
                end

                -- set working directory 
                vim.cmd("cd " .. vim.fn.fnameescape(entry.directory))

                -- either open the selected file in enter netrw
                vim.cmd(entry.file and "edit " .. vim.fn.fnameescape(entry.value) or "Ex")
            end)
            return true
        end
    })
    :find()
end

return M
