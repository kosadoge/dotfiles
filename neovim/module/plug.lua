return require("packer").startup({
    function(use)
        use "wbthomason/packer.nvim"

        -- Theme
        use {
            "sainnhe/gruvbox-material",
            setup = function()
                vim.g.gruvbox_material_background = "medium"
            end,
            config = function()
                vim.cmd([[colorscheme gruvbox-material]])
            end
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig"
        }

        -- Tree Sitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local update = require('nvim-treesitter.install').update({ with_sync = true })
                update()
            end,
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
                        component_separators = { left = "|", right = "|" }
                    }
                }
            end
        }

    end,
    config = {
        display = { open_fn = require("packer.util").float }
    }
})
