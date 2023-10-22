local setup = function()
    -- Add parser for norg
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs.norg = {
        install_info = {
            url = 'https://github.com/nvim-neorg/tree-sitter-norg',
            files = { 'src/parser.c', 'src/scanner.cc' },
            branch = 'main'
        },
    }

    require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'fish', 'latex', 'cpp', 'python',
                           'cmake', 'bibtex', 'yaml', 'lua', 'norg' },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = 'gnn',
              node_incremental = 'grn',
              scope_incremental = 'grc',
              node_decremental = 'grm',
            },
        },
        indent = {
            enable = false,
            -- disable = { 'python' },
        },
    }
    require('nvim-treesitter-textobjects')
    require('treesitter-context').setup()
end
return {
    setup = setup,
}
