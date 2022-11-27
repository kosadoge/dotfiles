local map = vim.api.nvim_set_keymap

-- Remove Up, Down, Left, Right
map("n", "<Up>", "<Nop>", {})
map("n", "<Down>", "<Nop>", {})
map("n", "<Left>", "<Nop>", {})
map("n", "<Right>", "<Nop>", {})