if vim.g.neovide then
    vim.opt.linespace = 0

    -- 缩放比例
    vim.g.neovide_scale_factor = 0.8

    -- 文本伽马和对比度
    vim.g.neovide_text_gamma = 0.0
    vim.g.neovide_text_contrast = 0.5

    -- 顶部、底部、右侧、左侧的内边距
    vim.g.neovide_padding_top = 2
    vim.g.neovide_padding_bottom = 2
    vim.g.neovide_padding_right = 2
    vim.g.neovide_padding_left = 2
    -- 窗口透明度（内容和标题栏统一）
    vim.g.neovide_transparency = 0.9

    vim.opt.clipboard = "unnamedplus"
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_cursor_trail_size = 0.6
    vim.keymap.set("n", "<F11>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, { noremap = true, silent = true, desc = "Toggle fullscreen" })

    vim.keymap.set("i", "<F11>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, { noremap = true, silent = true, desc = "Toggle fullscreen" })

    vim.keymap.set("v", "<F11>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, { noremap = true, silent = true, desc = "Toggle fullscreen" })
end
