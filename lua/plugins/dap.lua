return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        dap.adapters.android = {
            type = "executable",
            command = "adb",
            args = { "connect", "127.0.0.1:5555" }, -- 连接到 Android 设备或模拟器
        }

        dap.adapters.java = {
            type = "executable",
            command = "java",
            args = { "-jar", vim.fn.expand("~/Environment/jdt-language-server-1.45.0/plugins/*.jar") }, -- 替换为你的 jdtls jar 路径
        }

        dap.configurations.java = {
            {
                type = "android",
                request = "attach",
                name = "Attach to Android",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }

        dap.adapters.cppdbg = {
            type = "executable",
            command = "~/Code/C++_Project/HelloWorld/",
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
        }
    end,
}
