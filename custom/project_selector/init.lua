local config = require("drew.custom.project_selector.config")
local project_collector = require("drew.custom.project_selector.projects")
local picker = require("drew.custom.project_selector.picker")

local M = {}
local current_config

local function get_config()
  if not current_config then
    current_config = config.merge()
  end

  return current_config
end

function M.setup(opts)
  current_config = config.merge(opts)

  return M
end

function M.pick_project(opts)
  opts = opts or {}

  local active_config = get_config()
  local projects = project_collector.collect(active_config)

  if vim.tbl_isempty(projects) then
    vim.notify("No projects found", vim.log.levels.INFO)
    return
  end

  picker.open(opts, active_config, projects)
end

return M
