-- TODO Dashboard
-- TODO own colorscheme
vim.g.mapleader = " "
-- Basic Settings
require("settings")

-- lazy.nvim
require("lazy_plugins")

-- Keymap
require("keymap")

-- Theme (todo write own theme)
require("theme")

-- Statusline
require("statusline")

-- LSP Setup
require("lsp")
require("completion")
require("formatting")
