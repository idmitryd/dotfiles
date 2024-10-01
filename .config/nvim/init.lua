-- {{{ Plugins
-- {{{2 Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- {{{2 Map leaders
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.api.nvim_set_keymap('o', '<Space>', '', {})
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '\\', '', {})
vim.g.maplocalleader = '\\'
-- }}}2

--- }}}2
-- {{{2 Plugins load and setup
require('lazy').setup({
    {
        'ivanesmantovich/xkbswitch.nvim',
        config = function() require('xkbswitch').setup() end,
    },
    -- {
    --     'Wansmer/langmapper.nvim',
    --     lazy = false,
    --     priority = 1, -- High priority is needed if you will use `autoremap()`
    --     config = function()
    --         require('langmapper').setup({--[[ your config ]]})
    --     end,
    -- },
    -- {{{3 Colorschemes
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "kanagawa-wave"
        end,
    },
    --}}}3
    -- {{{3 Status line
    {
        'hoob3rt/lualine.nvim',
        -- lua/plugin/lualine
        config = function() require('plugin.lualine').setup() end,
    },
    -- }}}3
    -- {{{3 Buffer line
    {
        'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        event = "BufWinEnter",
        config = function()
            require('barbar').setup{
                clickable = false,
                letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
                icons = {
                    button = '',
                    pinned = {
                        button = '車',
                    },
                    separator = {
                        left = '▌',
                    },
                },
                -- icon_separator_inactive = '▌',
                -- icon_close_tab_modified = '●',
            }
        end,
    },
    -- }}}3
    -- {{{3 Which-key
    {
        'folke/which-key.nvim',
        event = 'BufWinEnter',
        config = function()
            -- lua/plugin/which-key
            require "plugin.which-key".setup()
        end,
    },
    -- }}}3
    -- {{{3 DashBoard
    {
        'ChristianChiarulli/dashboard-nvim',
        event = 'BufWinEnter',
        config = function()
            vim.g.dashboard_custom_section = {
                a = {
                    description = { "  Find File          " },
                    -- description = { "  Find File" },
                    command = "Telescope find_files",
                },
                b = {
                    description = { "  New File           " },
                    -- description = { "  New File" },
                    command = ":ene!",
                },
                c = {
                    description = { "  Recent Projects    " },
                    -- description = { "  Recent Projects" },
                    command = "Telescope projects",
                },
                d = {
                    description = { "  Recently Used Files" },
                    -- description = { "  Recently Used Files" },
                    command = "Telescope oldfiles",
                },
                e = {
                    description = { "  Find Word          " },
                    -- description = { "  Find Word" },
                    command = "Telescope live_grep",
                },
                f = {
                    description = { "  Configuration      " },
                    -- description = { "  Configuration" },
                    command = ":e " .. vim.fn.stdpath('config') .. '/init.lua',
                },
            }
            vim.g.dashboard_custom_header = {
                '    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄     ⢀⣿⣿   ⢸⡇⠄⠄                                                         ⣿⣿⣷⡁⢆⠈⠕⢕⢂⢕⢂⢕⢂⢔⢂⢕⢄⠂⣂⠂⠆⢂⢕⢂⢕⢂⢕⢂⢕⢂ ',
                '    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀ ⢠⣾⣛⡉   ⠸⢀⣿⠄                                                         ⣿⣿⣿⡷⠊⡢⡹⣦⡑⢂⢕⢂⢕⢂⢕⢂⠕⠔⠌⠝⠛⠶⠶⢶⣦⣄⢂⢕⢂⢕ ',
                '   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄                                                         ⣿⣿⠏⣠⣾⣦⡐⢌⢿⣷⣦⣅⡑⠕⠡⠐⢿⠿⣛⠟⠛⠛⠛⠛⠡⢷⡈⢂⢕⢂ ',
                '   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄                                                         ⠟⣡⣾⣿⣿⣿⣿⣦⣑⠝⢿⣿⣿⣿⣿⣿⡵⢁⣤⣶⣶⣿⢿⢿⢿⡟⢻⣤⢑⢂ ',
                '  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ⣾⣿⣿⡿⢟⣛⣻⣿⣿⣿⣦⣬⣙⣻⣿⣿⣷⣿⣿⢟⢝⢕⢕⢕⢕⢽⣿⣿⣷⣔ ',
                '  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ⣿⣿⠵⠚⠉⢀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢕⢕⢕⢕⢕⢕⣽⣿⣿⣿⣿ ',
                ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ⢷⣂⣠⣴⣾⡿⡿⡻⡻⣿⣿⣴⣿⣿⣿⣿⣿⣿⣷⣵⣵⣵⣷⣿⣿⣿⣿⣿⣿⡿ ',
                ' ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟   ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║  ⠻⣿⡿⡫⡪⡪⡪⡪⣺⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃ ',
                ' ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃   ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║   ⠹⡪⡪⡪⡪⣪⣾⣿⣿⣿⣿⠋⠐⢉⢍⢄⢌⠻⣿⣿⣿⣿⣿⣿⣿⣿⠏  ',
                ' ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆        ⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃   ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝    ⠙⣾⣾⣾⣿⣿⣿⣿⣿⣿⡀⢐⢕⢕⢕⢕⢕⡘⣿⣿⣿⣿⣿⣿⠏   ',
                '  ⠘⣿⣿⣿⣿⣿⣿⣿⣿ ⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃                                                               ⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢐⢕⢕⢕⢕⢕⢅⣿⣿⣿⣿⡿⢋⢜   ',
                '   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁                                                                 ⠈⠻⣿⣿⣿⣿⣿⣿⣿⣷⣕⣑⣑⣑⣵⣿⣿⣿⡿⢋⢔⢕⣿   ',
                '     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁                                                                      ⠉⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢔⢕⢕⣿⣿   ',
                '        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁                                                                                ⠉⢍⢛⢛⢛⢋⢔⢕⢕⢕⣽⣿⣿   ',

                --                     ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                --                     ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                --                     ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                --                     ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                --                     ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                --                     ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            }
            vim.api.nvim_command('autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2')
            vim.api.nvim_command('autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ')
            vim.api.nvim_command('autocmd FileType dashboard nnoremap <silent> <buffer> q :q<CR>')
        end,
    },
    -- }}}3
    -- {{{3 nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'kdheepak/cmp-latex-symbols'
        },
        -- lua/plugin/cmp
        config = function()
            require('plugin.cmp').setup()
            vim.b.cmp_toggle_flag = true
        end,
    },
    -- }}}
    -- {{{3 LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        -- lua/plugin/lsp
        config = function() require('plugin.lsp').setup() end,
    },
    {
        "tami5/lspsaga.nvim",
        config = function()
            require('lspsaga').setup()
            local options = { noremap = true }
            vim.api.nvim_set_keymap('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", options)
            vim.api.nvim_set_keymap('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", options)
        end,
    },
    -- }}}3
    -- {{{3 Tree-sitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/nvim-treesitter-context',
        },
        build = ':TSUpdate',
        config = function()
            -- lua/plugin/nvim-treesitter
            require'plugin.nvim-treesitter'.setup()
        end,
    },
    -- }}}3
    -- {{{3 Trouble
    {
        'folke/trouble.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('trouble').setup {
                height = 8,
                auto_preview = false,
                auto_fold = true,
            }
        end,
    },
    -- }}}3
    -- {{{3 Debug
    {
        'mfussenegger/nvim-dap',
        dependencies = { 'rcarriga/nvim-dap-ui', 'Pocco81/DAPInstall.nvim'},
        -- ft = 'cpp',
        config = function()
            -- lua/plugin/dap
            require('plugin.dap').setup()
        end,
    },
    -- }}}3
    -- {{{3 Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-project.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    selection_caret = ' ',
                    prompt_prefix = " ",

                },
                extentions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    },
                },
            }
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('project')
            require('telescope').load_extension('projects')
            -- require("telescope").load_extension('notify')
        end,
    },
    -- }}}3
    -- {{{3 Project manager
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- Manual mode doesn't automatically change your root directory, so you have
                -- the option to manually do so using `:ProjectRoot` command.
                manual_mode = false,

                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },

                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},

                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},

                -- Show hidden files in telescope
                show_hidden = false,

                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,

                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"),
            }
        end,
    },
    -- }}}3
    -- {{{3 Comments
    {
        "numToStr/Comment.nvim",
        event = "BufRead",
        config = function()
            require('Comment').setup({
                ignore = '^$',
                mappings = {
                    basic = true,
                    extra = true,
                },
            })
        end,
    },
    -- }}}3
    -- {{{3 Motion
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function() require("hop").setup() end,
    },
    -- {
        --     "ggandor/leap.nvim",
        --     config = function() require("leap").setup{} end,
        -- },
        -- }}}3
        -- {{{3 Identation guides
        {
            "lukas-reineke/indent-blankline.nvim",
            main = 'ibl',
            opts={},
            event = "BufRead",
            -- setup = function()
                --     vim.g.indentLine_enabled = 1
                --     vim.g.indent_blankline_char = "▏"
                --     vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
                --     vim.g.indent_blankline_buftype_exclude = {"terminal"}
                --     vim.g.indent_blankline_show_trailing_blankline_indent = false
                --     vim.g.indent_blankline_show_first_indent_level = false
                -- end,
                config = function()
                    local hooks = require('ibl.hooks')
                    hooks.register(
                    hooks.type.WHITESPACE,
                    hooks.builtin.hide_first_space_indent_level
                    )
                    require("ibl").setup {
                        indent = {
                            char = "▏",
                        },
                        exclude = {
                            buftypes = {"terminal"},
                            filetypes = {"help", "terminal", "dashboard"},
                        },
                        scope = {
                            enabled = false,
                        },
                    }
                end,
            },
            -- }}}3
            -- {{{3 LaTeX support
            {
                'lervag/vimtex',
                config = function()
                    vim.g.vimtex_view_general_viewer = 'okular'
                    vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
                    -- vim.g.vimtex_view_general_options_latexmk = '--unique'
                    vim.g.vimtex_syntax_conceal_disable = 1
                    vim.g.vimtex_quickfix_enabled = 0
                end,
            },
            -- }}}3
            -- {{{ File explorer
            -- {
                --     'kyazdani42/nvim-tree.lua',
                --     dependencies = {
                    --         'ryanoasis/vim-devicons',
                    --         'kyazdani42/nvim-web-devicons',
                    --     },
                    --     config = function()
                        --         -- lua/plugin/nvimtree
                        --         require "plugin.nvimtree".setup()
                        --     end,
                        -- },
                        -- }}}3
                        -- {{{3 Surrounding
                        {
                            "ur4ltz/surround.nvim",
                            config = function()
                                -- require('surround').setup{load_keymaps=false}
                                require('surround').setup{
                                    prefix = "S",
                                }
                                -- It is needed to use 's' character in select mode that snippets use
                                -- vim.cmd('sunmap s')
                            end,
                        },
                        -- }}}3
                        -- {{{3 Better whitespace
                        {
                            'ntpeters/vim-better-whitespace',
                            config = function()
                                vim.g.strip_whitespace_on_save = 0
                                vim.g.better_whitespace_filetypes_blacklist = { 'diff', 'git', 'gitcommit', 'unite',
                                'qf', 'help', 'markdown', 'fugitive', 'dashboard', 'terminal' }
                            end,
                        },
                        -- }}}3
                        --  {{{3 Terminal
                        {
                            "akinsho/toggleterm.nvim",
                            event = "BufWinEnter",
                            config = function()
                                require "toggleterm".setup({
                                    hidden = true,
                                    open_mapping = [[<c-t>]],
                                    direction = "float",
                                    shell = vim.o.shell,
                                    close_on_exit = true,
                                    float_opts = {
                                        border = "curved",
                                        winblend = 0,
                                    },
                                })
                            end,
                        },
                        -- }}}3
                        -- {{{3 Gitsigns
                        {
                            'lewis6991/gitsigns.nvim',
                            dependencies = {
                                'nvim-lua/plenary.nvim',
                            },
                            -- after = 'gruvqueen',
                            event = "BufRead",
                            config = function()
                                require('gitsigns').setup({
                                    signs = {
                                        add = {
                                            hl = "GitSignsAdd",
                                            text = "▎",
                                            numhl = "GitSignsAddNr",
                                            linehl = "GitSignsAddLn",
                                        },
                                        change = {
                                            hl = "GitSignsChange",
                                            text = "▎",
                                            numhl = "GitSignsChangeNr",
                                            linehl = "GitSignsChangeLn",
                                        },
                                        delete = {
                                            hl = "GitSignsDelete",
                                            text = "契",
                                            numhl = "GitSignsDeleteNr",
                                            linehl = "GitSignsDeleteLn",
                                        },
                                        topdelete = {
                                            hl = "GitSignsDelete",
                                            text = "契",
                                            numhl = "GitSignsDeleteNr",
                                            linehl = "GitSignsDeleteLn",
                                        },
                                        changedelete = {
                                            hl = "GitSignsChange",
                                            text = "▎",
                                            numhl = "GitSignsChangeNr",
                                            linehl = "GitSignsChangeLn",
                                        },
                                    },
                                    numhl = false,
                                    linehl = false,
                                    watch_gitdir = { interval = 1000 },
                                    sign_priority = 6,
                                    update_debounce = 200,
                                    status_formatter = nil, -- Use default
                                })
                            end,
                        },
                        -- }}}3
                        -- {{{3 Colorizer
                        {
                            "norcalli/nvim-colorizer.lua"
                        },
                        -- }}}3
                        -- {{{3 Snippets
                        {
                            "L3MON4D3/LuaSnip",
                            dependencies = "rafamadriz/friendly-snippets",
                            config = function() require("luasnip/loaders/from_vscode").lazy_load() end,
                        },
                        -- }}}
                        -- {{{3 FixCursorHold
                        {
                            "antoinemadec/FixCursorHold.nvim"
                        },
                        --- }}}
                        -- {{{3 Notify
                        -- {
                            --     "rcarriga/nvim-notify",
                            --     config = function()
                                --         local notify = require("notify")
                                --         notify.setup({
                                    --             -- Animation style (see below for details)
                                    --             stages = "fade_in_slide_out",
                                    --             -- Function called when a new window is opened, use for changing win settings/config
                                    --             on_open = nil,
                                    --             -- Function called when a window is closed
                                    --             on_close = nil,
                                    --             -- Render function for notifications. See notify-render()
                                    --             render = "default",
                                    --             -- Default timeout for notifications
                                    --             timeout = 5000,
                                    --             -- For stages that change opacity this is treated as the highlight behind the window
                                    --             -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
                                    --             background_colour = "#282828",
                                    --             -- Minimum width for notification windows
                                    --             minimum_width = 50,
                                    --             -- Icons for the different levels
                                    --             icons = {
                                        --                 ERROR = "",
                                        --                 WARN = "",
                                        --                 INFO = "",
                                        --                 DEBUG = "",
                                        --                 TRACE = "✎",
                                        --             },
                                        --         })
                                        --         vim.notify = notify
                                        --     end,
                                        -- },
                                        -- }}}
                                        -- {{{3 UI helpers
                                        {
                                            'stevearc/dressing.nvim',
                                            config = function()
                                                require('dressing').setup({
                                                    input = {
                                                        insert_only = false,
                                                    }
                                                })
                                            end,
                                        },
                                        -- }}}
                                        config = {
                                            -- {{{3 Packer config
                                            display = {
                                                open_fn = function()
                                                    return require('packer.util').float({ border = "single" })
                                                end        }
                                                -- }}}3
                                            },
                                        })
                                        --- }}}2
                                        -- }}}
                                        -- {{{ Settings
                                        local g = vim.g
                                        local o = vim.o
                                        local wo = vim.wo
                                        local bo = vim.bo
                                        local map = vim.api.nvim_set_keymap

                                        -- {{{2 Autogroups
                                        -- Need to make nvim to recognize .fish files
                                        -- vim.cmd('au! BufRead,BufNewFile *.fish set filetype=fish')
                                        -- Need to setlocal foldmethod=marker for init.lua
                                        -- vim.api.nvim_exec(
                                        -- [[
                                        -- augroup config
                                        -- autocmd!
                                        -- autocmd BufEnter init.lua setlocal foldmethod=marker
                                        -- augroup end
                                        -- ]],
                                        -- false
                                        -- )
                                        -- }}}2
                                        -- {{{2 Set colorsheme
                                        -- }}}2
                                        -- {{{2 options and variables
                                        -- global options and variables
                                        -- g.nvim_tree_respect_buf_cwd = 1
                                        g.cursorhold_updatetime = 300
                                        g.XkbSwitchEnabled = 1
                                        g.XkbSwitchLib = '/usr/local/lib64/libg3kbswitch.so'

                                        o.cmdheight = 2
                                        o.showtabline = 2
                                        o.hidden = true
                                        o.timeoutlen = 300
                                        -- o.updatetime = 300
                                        -- o.swapfile = false
                                        o.termguicolors = true
                                        o.background = 'dark'
                                        o.cursorline = true
                                        o.splitbelow = true
                                        o.splitright = true
                                        o.completeopt = 'menuone,preview,noinsert,noselect'
                                        o.wildmenu = true
                                        o.wildmode = 'longest:full,full'
                                        o.wrap = false
                                        o.ignorecase = true
                                        o.smartcase = true
                                        o.scrolloff = 8
                                        o.sidescrolloff = 8
                                        o.signcolumn = "yes"
                                        o.showmode = false

                                        -- buffer-local options
                                        bo.keymap = 'russian-jcukenwin'
                                        bo.iminsert = 0
                                        bo.imsearch = -1

                                        -- window-local options
                                        wo.number = true
                                        wo.colorcolumn='101'
                                        -- }}}2
                                        --- }}}
                                        -- {{{ Mappings
                                        local options = { noremap = true }

                                        -- {{{2 normal mode maps
                                        map('n', '<C-l>', '<C-w>l', options)
                                        map('n', '<C-h>', '<C-w>h', options)
                                        map('n', '<C-j>', '<C-w>j', options)
                                        map('n', '<C-k>', '<C-w>k', options)
                                        map('n', 's', '<cmd>HopChar2<cr>', options)
                                        map('n', '<A-h>', '5zh', options)
                                        map('n', '<A-l>', '5zl', options)
                                        -- }}}2
                                        -- {{{2 insert mode maps
                                        map('i', '<F3>', '<C-^>', options)
                                        map('i', '<C-х>', '<Esc>', options)
                                        -- }}}2
                                        -- {{{2 command-line mode maps
                                        map('c', '<F3>', '<C-^>', options)
                                        map('c', '%%', "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true })
                                        -- vim.cmd("cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'")
                                        -- }}}2
                                        -- {{{2 terminal mode map
                                        map('t', '<Esc>', '<C-\\><C-n>', options)

                                        -- local function escape(str)
                                        --     -- You need to escape these characters to work correctly
                                        --     local escape_chars = [[;,."|\]]
                                        --     return vim.fn.escape(str, escape_chars)
                                        -- end

                                        -- -- Recommended to use lua template string
                                        -- local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
                                        -- local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
                                        -- local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
                                        -- local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

                                        -- vim.opt.langmap = vim.fn.join({
                                        --     -- | `to` should be first     | `from` should be second
                                        --     escape(ru_shift) .. ';' .. escape(en_shift),
                                        --     escape(ru) .. ';' .. escape(en),
                                        -- }, ',')
                                        -- }}}2
                                        -- }}}

                                        -- vim: foldmethod=marker
