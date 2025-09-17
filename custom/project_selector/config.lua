local home = vim.loop.os_homedir()

local default_config = {
  file_browser = function()
    if vim.fn.exists(":Oil") == 1 then
      return "Oil"
    end

    return "Ex"
  end,
  projects = {
    {
      name = "Neovim: Config",
      path = vim.fn.stdpath("config") .. "/lua/drew",
      type = "directory",
    },
    {
      name = "Shell: RC Files",
      path = home .. "/.zsh.d",
      type = "directory",
      condition = function()
        return vim.fn.has("macunix") == 1
      end,
    },
    {
      name = "Shell: RC Files",
      path = home .. "/.bashrc.d",
      type = "directory",
      condition = function()
        return vim.fn.has("linux") == 1
      end,
    },
    {
      name = "Videos: Last Watched",
      path = home .. "/Movies/last-watched",
      type = "file",
      condition = function()
        return vim.fn.has("macunix") == 1
      end,
    },
    {
      name = "Videos: Last Watched",
      path = home .. "/Videos/last-watched",
      type = "file",
      condition = function()
        return vim.fn.has("linux") == 1
      end,
    },
  },
  tracked_directories = {
    { name = "Projects", path = home .. "/Projects" },
    { name = "Personal", path = home .. "/Personal" },
    { name = "Uni", path = home .. "/Uni" },
    { name = "Work", path = home .. "/Work" },
    { name = "Documents", path = home .. "/Documents" },
    { name = "RISC-V", path = home .. "/riscv" },
  },
}

local M = {}

function M.default()
  return vim.deepcopy(default_config)
end

function M.merge(opts)
  if opts and next(opts) ~= nil then
    return vim.tbl_deep_extend("force", M.default(), opts)
  end

  return M.default()
end

return M
