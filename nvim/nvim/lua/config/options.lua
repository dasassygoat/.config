-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Update this path
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "/usr/bin/lldb"
local this_os = vim.loop.os_uname().sysname

-- The path in windows is different
-- The liblldb extension is .so for linux and .dylib for macOS
liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

local options = {
  dap = {
    --adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}

return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
}
