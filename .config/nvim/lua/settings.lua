-- Mouse, Clipboard, ...
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a' -- Mouse can be used

-- Line Numbering
vim.opt.number = true 
vim.opt.relativenumber = true

-- Indentation & Tabs
vim.opt.expandtab = true -- everything else is pain
vim.opt.autoindent = true -- yes please
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- UI
vim.opt.splitbelow = true 
vim.opt.splitright = true  
vim.opt.showmode = false
vim.opt.termguicolors = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Misc
vim.opt.hidden = true -- Allow hiding unsaved buffers
vim.opt.encoding = 'utf-8'
