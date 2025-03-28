-- lua/plugins/translate.lua
return {
    {
        "voldikss/vim-translator",
        event = "VeryLazy", -- 延迟加载（可选，提升启动速度）
        config = function()
            -- 基础配置
            vim.g.translator_default_engines = { "youdao" } -- 指定翻译引擎
            vim.g.translator_window_style = "preview" -- 设置翻译结果显示窗口样式
            vim.g.translator_default_target = "zh" -- 默认目标语言为中文

            -- 快捷键映射
            vim.keymap.set("v", "<leader>tt", ":TranslateW<CR>", { desc = "翻译选中文本" })
        end,
    },
}
