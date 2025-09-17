local M = {}

local function is_enabled(entry)
  return not entry.condition or entry.condition()
end

local function normalize_path(path)
  local expanded = vim.fn.expand(path)
  local absolute = vim.fn.fnamemodify(expanded, ":p")
  local sanitized = absolute:gsub("/+$", "")

  if sanitized == "" then
    return absolute
  end

  return sanitized
end

local function entry_is_available(entry)
  if entry.type == "file" then
    return true
  end

  return vim.fn.isdirectory(entry.path) ~= 0
end

local function build_manual_projects(config)
  local items = {}

  for _, project in ipairs(config.projects or {}) do
    if is_enabled(project) then
      local normalized = {
        name = project.name,
        path = normalize_path(project.path),
        type = project.type or "directory",
      }

      if entry_is_available(normalized) then
        table.insert(items, normalized)
      end
    end
  end

  return items
end

local function build_tracked_projects(config)
  local items = {}

  for _, directory in ipairs(config.tracked_directories or {}) do
    if is_enabled(directory) then
      local base_path = normalize_path(directory.path)

      if vim.fn.isdirectory(base_path) ~= 0 then
        local pattern = vim.fn.escape(base_path, "\\") .. "/*"
        local children = vim.fn.glob(pattern, false, true)

        for _, child in ipairs(children) do
          if vim.fn.isdirectory(child) ~= 0 then
            local child_path = normalize_path(child)
            local child_name = vim.fn.fnamemodify(child_path, ":t")

            table.insert(items, {
              name = string.format("%s: %s", directory.name, child_name),
              path = child_path,
              type = directory.type or "directory",
            })
          end
        end
      end
    end
  end

  return items
end

function M.collect(config)
  local projects = {}

  vim.list_extend(projects, build_manual_projects(config))
  vim.list_extend(projects, build_tracked_projects(config))

  return projects
end

return M
