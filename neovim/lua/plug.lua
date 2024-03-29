-- Install plugin manager if not exists
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) then
    vim.fn.system({"git", "clone", '--depth', '1', "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd([[packadd packer.nvim]])
end


return require("packer").startup({
    function(use)
        use { "wbthomason/packer.nvim" }

        -- Theme
        use {
            "sainnhe/gruvbox-material",
            setup = function()
                vim.g.gruvbox_material_foreground = "material"
                vim.g.gruvbox_material_background = "medium"
                vim.g.gruvbox_material_better_performance = 1
            end,
            config = function() vim.cmd([[colorscheme gruvbox-material]]) end
        }

        -- LSP
        use { "neovim/nvim-lspconfig" }

        -- Tree Sitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function() require("nvim-treesitter.install").update { with_sync = true } end,
            config = function()
                require("nvim-treesitter.configs").setup {
                    highlight = {
                        enable = true
                    }
                }
            end
        }

        -- Fuzzy Finder
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            requires = { {"nvim-lua/plenary.nvim"} },
            config = function()
                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
                vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
            end
        }

        -- File Browser
        use {
            "nvim-tree/nvim-tree.lua",
            tag = "nightly",
            requires = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("nvim-tree").setup {}
                vim.keymap.set("n", "<Leader>b", ":NvimTreeFindFileToggle!<CR>", {})
            end
        }

        -- Status Bar
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "nvim-lualine/lualine.nvim", opt = true },
            config = function()
                require("lualine").setup {
                    options = {
                        theme = "gruvbox-material",
                        section_separators = "",
                        component_separators = { left = "|", right = "|" },
                    },
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = { "branch", "diff", "diagnostics" },
                        lualine_c = { "filename" },
                        lualine_x = { "encoding", "filetype" },
                        lualine_y = { "progress" },
                        lualine_z = { "location "}
                    }
                }
            end
        }

    end,
    config = {
        display = {
            done_sym = "✔️",
            working_sym = "↻",
            error_sym = "✘",
            open_fn = require("packer.util").float
        }
    }
})
