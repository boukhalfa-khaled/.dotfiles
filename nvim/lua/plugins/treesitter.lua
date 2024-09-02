return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require"nvim-treesitter.configs".setup{
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query"},
            auto_install = true,
            highlight = {
                enable = true,
            },

        }

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade"
        }
    end,
}
