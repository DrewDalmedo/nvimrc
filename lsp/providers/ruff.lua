--- Alt. Python LSP
---
---@type LSPProvider
return {
  name = "ruff",
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml" },
}
