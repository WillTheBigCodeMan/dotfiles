return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            ["shfmt"] = {
                prepend_args = { "-ln", "bash" },
            },
            ["clang-format"] = {
                args = "-style='{IndentWidth: 4,}'",
            },
            ["prettier"] = {
                prepend_args = { "--tab-width", "4" },
            },
        },
        formatters_by_ft = {
            awk = { "awk" },
            c = { "clang-format" },
            rust = { "rustfmt" },
            ruby = { "rubocop" },
            eruby = { "erb_format" },
            json = { "prettier" },
            html = { "prettier" },
        },
    },
}
