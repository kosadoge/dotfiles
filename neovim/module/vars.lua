local var = vim.g

var.t_co = 256          -- Set Terminal Color 256
var.background = "dark" -- Set Dark Mode

-- Remove native file browser
var.loaded_netrw = 1
var.loaded_netrwPlugin = 1

-- Neovide
if var.neovide then
    var.neovide_fullscreen = true
    var.neovide_cursor_antialiasing = false
    var.neovide_cursor_animation_length = 0.0125
end