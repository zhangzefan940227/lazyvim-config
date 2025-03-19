local function compile_file()
    -- 获取当前文件的路径和名称
    local file_path = vim.fn.expand("%:p") -- 当前文件的完整路径
    local file_name = vim.fn.expand("%:t:r") -- 当前文件的名称（不带扩展名）
    local output_path = vim.fn.getcwd() .. "/" .. file_name -- 输出文件路径

    -- 选择编译器（g++ 或 clang++）
    local compiler = "g++"
    if vim.fn.executable("clang++") == 1 then
        compiler = "clang++"
    end

    -- 构建编译命令
    local compile_cmd = string.format("%s -g -Wall -std=c++17 -o %s %s", compiler, output_path, file_path)

    -- 执行编译命令
    local handle = io.popen(compile_cmd)
    local result = handle:read("*a")
    handle:close()

    -- 显示编译结果
    if result == "" then
        vim.notify("编译成功: " .. output_path, vim.log.levels.INFO)
    else
        vim.notify("编译失败: " .. result, vim.log.levels.ERROR)
    end
end

-- 创建自定义命令
vim.api.nvim_create_user_command("CompileFile", compile_file, {})
