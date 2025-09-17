local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local M = {}

local function resolve_file_browser(config, project)
  local browser = config.file_browser

  if type(browser) == "function" then
    browser = browser(project)
  end

  if browser == nil or browser == "" then
    return nil
  end

  return browser
end

function M.open(opts, config, projects)
  local make_from_file = make_entry.gen_from_file(opts)

  pickers
    .new(opts, {
      prompt_title = "Projects",
      finder = finders.new_table({
        results = projects,
        entry_maker = function(item)
          local entry = make_from_file(item.path)
          entry.display = item.name or entry.display
          entry.ordinal = string.format("%s %s", item.name or "", item.path)
          entry.project = item
          return entry
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)

          local selection = action_state.get_selected_entry()

          if not selection or not selection.project then
            return
          end

          local project = selection.project
          local target_directory = project.type == "file" and vim.fn.fnamemodify(project.path, ":h") or project.path

          if target_directory and target_directory ~= "" then
            local ok, err = pcall(vim.api.nvim_set_current_dir, target_directory)

            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
              return
            end
          end

          if project.type == "file" then
            vim.cmd.edit(vim.fn.fnameescape(project.path))
            return
          end

          local browser = resolve_file_browser(config, project)

          if browser then
            vim.cmd(string.format("%s %s", browser, vim.fn.fnameescape(project.path)))
          end
        end)

        return true
      end,
    })
    :find()
end

return M
