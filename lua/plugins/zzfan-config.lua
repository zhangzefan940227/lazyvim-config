return {
    ------ markdown ------
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
    },

    ----- 多窗口的边框样式 -----
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinNew" },
    },

    ----- 可以缩写命令在ex模式执行 -----
    {
        "LintaoAmons/easy-commands.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            require("easy-commands").setup()
        end,
    },

    ----- 快速光标跳转 -----
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {
            keys = "etovxqpdygfblzhckisuran",
        },
    },
}
