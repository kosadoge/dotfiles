local manager_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(manager_path) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", manager_path})
end
vim.opt.rtp:prepend(manager_path)


require("lazy").setup({
    -- LSP
    { "neovim/nvim-lspconfig" },

    -- Theme
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        init = function()
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_better_performance = 1
        end,
        config = function() vim.cmd([[colorscheme gruvbox-material]]) end,
    },

    -- NerdTree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("nvim-tree").setup() end,
    },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        end,
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Status Bar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox-material",
                },
            })
        end,
    },

    -- Tree Sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    },
})
