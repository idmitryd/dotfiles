local config = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
        spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        mappings = false,
    },
    -- window = {
    --     border = "single", -- none, single, double, shadow
    --     position = "bottom", -- bottom, top
    --     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    --     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    -- },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
    },
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
    -- ["/"] = { "<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>", "Comment" },
    l = {
        name = "LSP",
        F = { "<esc><cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format" },
    },
}
local mappings = {
    -- ["w"] = { "<cmd>w!<CR>", "Save" },
    -- ["q"] = { "<cmd>q!<CR>", "Quit" },
    -- ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
    -- ["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    -- ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    -- [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
    -- b = {
    --     name = "Buffers",
    --     j = { "<cmd>BufferPick<cr>", "Jump" },
    --     f = { "<cmd>Telescope buffers<cr>", "Find" },
    --     w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
    --     p = { "<cmd>BufferPin<cr>", "Pin" },
    --     P = { "<cmd>BufferCloseAllButPinned<cr>", "Close all but pinned" },
    --     e = {
    --         "<cmd>BufferCloseAllButCurrent<cr>",
    --         "Close all but current",
    --     },
    --     h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
    --     l = {
    --         "<cmd>BufferCloseBuffersRight<cr>",
    --         "Close all to the right",
    --     },
    --     D = {
    --         "<cmd>BufferOrderByDirectory<cr>",
    --         "Sort by directory",
    --     },
    --     L = {
    --         "<cmd>BufferOrderByLanguage<cr>",
    --         "Sort by language",
    --     },
    -- },
    -- p = {
    --     name = "Packer",
    --     c = { "<cmd>PackerCompile<cr>", "Compile" },
    --     i = { "<cmd>PackerInstall<cr>", "Install" },
    --     s = { "<cmd>PackerSync<cr>", "Sync" },
    --     S = { "<cmd>PackerStatus<cr>", "Status" },
    --     u = { "<cmd>PackerUpdate<cr>", "Update" },
    -- },
    -- g = {
    --     name = "Git",
    --     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    --     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    --     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    --     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    --     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    --     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    --     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    --     u = {
    --         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    --         "Undo Stage Hunk",
    --     },
    --     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    --     C = {
    --         "<cmd>Telescope git_bcommits<cr>",
    --         "Checkout commit(for current file)",
    --     },
    --     d = {
    --         "<cmd>Gitsigns diffthis HEAD<cr>",
    --         "Git Diff",
    --     },
    -- },
    -- l = {
    --     name = "LSP",
    --     a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    --     d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
    --     D = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
    --     F = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    --     f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder", },
    --     i = { "<cmd>LspInfo<cr>", "Info" },
    --     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    --     j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic", },
    --     k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic", },
    --     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    --     r = { "<cmd>:Lspsaga rename<cr>", "Rename" },
    --     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find Document Symbols" },
    --     S = {
    --         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --         "Find Workspace Symbols",
    --     },
    --     w = { "<cmd>Lspsaga show_line_diagnostics<cr>", "What's wrong?" },
    --     h = { "<cmd>Lspsaga signature_help<CR>", "Signature Help" },
    --     H = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
    -- },
    -- f = {
    --     name = "Find",
    --     f = { "<cmd>Telescope find_files<CR>", "File" },
    --     F = { "<cmd>lua require'functions'.find_file()<CR>", "File Under Cursor" },
    --     -- F = { "<cmd>lua require'telescope.builtin'.find_files({" ..
    --     --       "find_command={'find', '-L', '.', '-name', '*' .. vim.fn.expand('<cword>') .. '*'}" ..
    --     --       "})<CR>",
    --     -- "File Under Cursor" },
    --     h = { "<cmd>Telescope help_tags<cr>", "Help" },
    --     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    --     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    --     -- t = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Text in Current Buffer" },
    --     t = { "<cmd>lua require'functions'.current_buffer_fuzzy_find()<CR>", "Text in Current Buffer" },
    --     T = { "<cmd>Telescope live_grep<cr>", "Text in CWD" },
    --     p = { "<cmd>Telescope projects<CR>", "Projects" },
    --     s = {"<cmd>lua require'functions'.grep_string_current_buffer()<CR>",
    --     "String Under Cursor in Current Buffer" },
    --     S = { "<cmd>Telescope grep_string<CR>", "String Under Cursor in CWD"},
    --     l = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP Document Symbols" },
    --     L = {
    --         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --         "LSP Workspace Symbols",
    --     },
    --     b = { "<cmd>Telescope buffers<cr>", "Find" },
    -- },
    -- T = {
    --     name = "Trouble",
    --     t = { "<cmd>TroubleToggle<cr>", "Toggle"},
    --     r = { "<cmd>Trouble lsp_references<cr>", "References" },
    --     f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    --     d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostics" },
    --     q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    --     l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    --     w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    -- },
    -- t = {
    --     name = "Toggle",
    --     c = { "<cmd>lua require'functions'.toggle_completion()<cr>", "Completion" },
    --     t = { "<cmd>lua require'functions'.float_edit(\"~/.todo.md\")<cr>", "TODO tasks" },
    --     s = { "<cmd>lua require'functions'.toggle_spell()<cr>", "Spelling" },
    -- },
    -- -- ["<Space>"] = {
    -- h = {
    --     name = "Hop",
    --     w = { "<cmd>HopWord<cr>", "Word"},
    --     l = { "<cmd>HopLineStart<cr>", "Line Start"},
    --     c = { "<cmd>HopChar1<cr>", "One Char"},
    --     d = { "<cmd>HopChar2<cr>", "Two Chars"},
    --     p = { "<cmd>HopPattern<cr>", "Pattern"},
    --     b = { "<cmd>BufferPick<cr>", "Buffer" },
    -- },
    -- d = {
    -- name = "Debug",
    -- t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    -- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    -- C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    -- d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    -- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    -- u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    -- p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    -- r = { "<cmd>lua require'dap'.repl.toggle(nil, \"10split new\")<cr>", "Toggle Repl" },
    -- q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    -- U = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    -- s = { "<cmd>lua require('dapui').float_element(\"scopes\", {enter=true})<cr>", "Show Scopes" },
    -- S = { "<cmd>lua require('dapui').float_element(\"stacks\", {enter=true})<cr>", "Show Stacks" },
    -- B = { "<cmd>lua require('dapui').float_element(\"breakpoints\", {enter=true})<cr>", "Show Breakpoints" },
    -- W = { "<cmd>lua require('dapui').float_element(\"watches\", {enter=true})<cr>", "Show Watches" },
    -- v = { "<cmd>lua require('dapui').eval()<cr>", "Eval Variable" },
    -- },
    { "<leader>;", "<cmd>Dashboard<CR>", desc = "Dashboard", nowait = true, remap = false },
    { "<leader>H", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
    { "<leader>T", group = "Trouble", nowait = true, remap = false },
    { "<leader>Td", "<cmd>Trouble lsp_document_diagnostics<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
    { "<leader>Tf", "<cmd>Trouble lsp_definitions<cr>", desc = "Definitions", nowait = true, remap = false },
    { "<leader>Tl", "<cmd>Trouble loclist<cr>", desc = "LocationList", nowait = true, remap = false },
    { "<leader>Tq", "<cmd>Trouble quickfix<cr>", desc = "QuickFix", nowait = true, remap = false },
    { "<leader>Tr", "<cmd>Trouble lsp_references<cr>", desc = "References", nowait = true, remap = false },
    { "<leader>Tt", "<cmd>TroubleToggle<cr>", desc = "Toggle", nowait = true, remap = false },
    { "<leader>Tw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
    { "<leader>b", group = "Buffers", nowait = true, remap = false },
    { "<leader>bD", "<cmd>BufferOrderByDirectory<cr>", desc = "Sort by directory", nowait = true, remap = false },
    { "<leader>bL", "<cmd>BufferOrderByLanguage<cr>", desc = "Sort by language", nowait = true, remap = false },
    { "<leader>bP", "<cmd>BufferCloseAllButPinned<cr>", desc = "Close all but pinned", nowait = true, remap = false },
    { "<leader>be", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close all but current", nowait = true, remap = false },
    { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find", nowait = true, remap = false },
    { "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Close all to the left", nowait = true, remap = false },
    { "<leader>bj", "<cmd>BufferPick<cr>", desc = "Jump", nowait = true, remap = false },
    { "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>", desc = "Close all to the right", nowait = true, remap = false },
    { "<leader>bp", "<cmd>BufferPin<cr>", desc = "Pin", nowait = true, remap = false },
    { "<leader>bw", "<cmd>BufferWipeout<cr>", desc = "Wipeout", nowait = true, remap = false },
    { "<leader>c", "<cmd>BufferClose!<CR>", desc = "Close Buffer", nowait = true, remap = false },
    { "<leader>d", group = "Debug", nowait = true, remap = false },
    { "<leader>dB", "<cmd>lua require('dapui').float_element(\"breakpoints\", {enter=true})<cr>", desc = "Show Breakpoints", nowait = true, remap = false },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor", nowait = true, remap = false },
    { "<leader>dS", "<cmd>lua require('dapui').float_element(\"stacks\", {enter=true})<cr>", desc = "Show Stacks", nowait = true, remap = false },
    { "<leader>dU", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI", nowait = true, remap = false },
    { "<leader>dW", "<cmd>lua require('dapui').float_element(\"watches\", {enter=true})<cr>", desc = "Show Watches", nowait = true, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", nowait = true, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", nowait = true, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", nowait = true, remap = false },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", nowait = true, remap = false },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", nowait = true, remap = false },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", nowait = true, remap = false },
    { "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause", nowait = true, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit", nowait = true, remap = false },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle(nil, \"10split new\")<cr>", desc = "Toggle Repl", nowait = true, remap = false },
    { "<leader>ds", "<cmd>lua require('dapui').float_element(\"scopes\", {enter=true})<cr>", desc = "Show Scopes", nowait = true, remap = false },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", nowait = true, remap = false },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", nowait = true, remap = false },
    { "<leader>dv", "<cmd>lua require('dapui').eval()<cr>", desc = "Eval Variable", nowait = true, remap = false },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>f", group = "Find", nowait = true, remap = false },
    { "<leader>fF", "<cmd>lua require'functions'.find_file()<CR>", desc = "File Under Cursor", nowait = true, remap = false },
    { "<leader>fL", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "LSP Workspace Symbols", nowait = true, remap = false },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>fS", "<cmd>Telescope grep_string<CR>", desc = "String Under Cursor in CWD", nowait = true, remap = false },
    { "<leader>fT", "<cmd>Telescope live_grep<cr>", desc = "Text in CWD", nowait = true, remap = false },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find", nowait = true, remap = false },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "File", nowait = true, remap = false },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", nowait = true, remap = false },
    { "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Document Symbols", nowait = true, remap = false },
    { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects", nowait = true, remap = false },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>fs", "<cmd>lua require'functions'.grep_string_current_buffer()<CR>", desc = "String Under Cursor in Current Buffer", nowait = true, remap = false },
    { "<leader>ft", "<cmd>lua require'functions'.current_buffer_fuzzy_find()<CR>", desc = "Text in Current Buffer", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<leader>h", group = "Hop", nowait = true, remap = false },
    { "<leader>hb", "<cmd>BufferPick<cr>", desc = "Buffer", nowait = true, remap = false },
    { "<leader>hc", "<cmd>HopChar1<cr>", desc = "One Char", nowait = true, remap = false },
    { "<leader>hd", "<cmd>HopChar2<cr>", desc = "Two Chars", nowait = true, remap = false },
    { "<leader>hl", "<cmd>HopLineStart<cr>", desc = "Line Start", nowait = true, remap = false },
    { "<leader>hp", "<cmd>HopPattern<cr>", desc = "Pattern", nowait = true, remap = false },
    { "<leader>hw", "<cmd>HopWord<cr>", desc = "Word", nowait = true, remap = false },
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
    { "<leader>lF", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>lH", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc", nowait = true, remap = false },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find Workspace Symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
    { "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", desc = "Finder", nowait = true, remap = false },
    { "<leader>lh", "<cmd>Lspsaga signature_help<CR>", desc = "Signature Help", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>lr", "<cmd>:Lspsaga rename<cr>", desc = "Rename", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find Document Symbols", nowait = true, remap = false },
    { "<leader>lw", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "What's wrong?", nowait = true, remap = false },
    { "<leader>p", group = "Packer", nowait = true, remap = false },
    { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>t", group = "Toggle", nowait = true, remap = false },
    { "<leader>tc", "<cmd>lua require'functions'.toggle_completion()<cr>", desc = "Completion", nowait = true, remap = false },
    { "<leader>ts", "<cmd>lua require'functions'.toggle_spell()<cr>", desc = "Spelling", nowait = true, remap = false },
    { "<leader>tt", "<cmd>lua require'functions'.float_edit(\"~/.todo.md\")<cr>", desc = "TODO tasks", nowait = true, remap = false },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
    { "<leader>l", group = "LSP", mode = "v", nowait = true, remap = false },
    { "<leader>lF", "<esc><cmd>lua vim.lsp.buf.range_formatting()<CR>", desc = "Format", mode = "v", nowait = true, remap = false },

}

local setup = function()
    local which_key = require "which-key"
    which_key.setup(config)
    which_key.add(mappings)
    -- which_key.register(mappings, opts)
    -- which_key.register(vmappings, vopts)
end

return {
    setup = setup
}
