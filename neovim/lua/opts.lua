local opt = vim.opt

-- Context
opt.colorcolumn = "100"          -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column
opt.cmdheight = 0                -- str:  Bottom command line height

-- Filetypes
opt.encoding = "utf8"            -- str:  String encoding to use
opt.fileencoding = "utf8"        -- str:  File encoding to use

-- Theme
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- Search
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- Whitespace
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- Splits
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- Neovide
opt.guifont = "Iosevka Nerd Font:h16"

-- Shell
if vim.fn.has("win32") then
    opt.shell = "powershell"
else
    opt.shell = "pwsh"
end