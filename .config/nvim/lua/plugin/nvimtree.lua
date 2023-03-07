-- unknown option: setup | unknown option: allow_resize | unknown option: auto_ignore_ft | see :help nvim-tree-setup for available configuration options
local config = {
    setup = {
        open_on_tab = false,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
        },
        diagnostics = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            width = 30,
            side = "left",
            mappings = {
                custom_only = false,
            },
        },
        filters = {
            dotfiles = true,
            custom = { ".git", "node_modules", ".cache" },
        },
        actions = {
            open_file = {
                resize_window = true,
                quit_on_open = false,
            }
        },
        renderer = {
            root_folder_modifier = ":t",
            highlight_git = true,
            icons = {
                show = {
                    git = true,
                    folder = true,
                    file = true,
                    folder_arrow = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        deleted = "",
                        untracked = "U",
                        ignored = "◌",
                    },
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                    },
                },
            },
        },
    },
}

local on_open = function()
    if package.loaded["bufferline.state"] and config.setup.view.side == "left" then
        require("bufferline.api").set_offset(config.setup.view.width + 1, "")
    end
end

local on_close = function()
    local buf = tonumber(vim.fn.expand "<abuf>")
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "NvimTree" and package.loaded["bufferline.api"] then
        require("bufferline.api").set_offset(0)
    end
end

local setup = function()
    local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
    if not status_ok then
        error("Failed to load nvim-tree.config")
        return
    end
    local g = vim.g

    for opt, val in pairs(config) do
        g["nvim_tree_" .. opt] = val
    end

    local tree_cb = nvim_tree_config.nvim_tree_callback

    if not config.setup.view.mappings.list then
        config.setup.view.mappings.list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
        }
    end

    local tree_view = require "nvim-tree.view"

    -- Add nvim_tree open callback
    local open = tree_view.open
    tree_view.open = function()
        on_open()
        open()
    end

    vim.cmd "au WinClosed * lua require('plugin.nvimtree').on_close()"

    require("nvim-tree").setup(config.setup)
end

return {
    setup = setup,
    on_close = on_close
}
