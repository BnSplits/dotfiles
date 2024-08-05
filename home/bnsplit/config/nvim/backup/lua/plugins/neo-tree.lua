return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            -- popup_border_style = "double",
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰜌",
                    default = "*",
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖", -- this can only be used in the git_status source
                        renamed   = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
            },
            window = {
                position = "float",
                popup = {
                    size = {
                        height = "60%", -- Taille en pourcentage de l'écran
                        width = "40%",
                    },
                    position = "50%", -- Position centrée
                    border = "rounded",
                },
                mappings = {
                    ["<C-CR>"] = "set_root",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_hidden = false,
                }
            },
            vim.keymap.set("n", "<leader>t", ':Neotree toggle<CR>', {desc = "Toggle Neotree",noremap = true, silent = true })

        })
    end
}
