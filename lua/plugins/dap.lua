return {
    {
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

            -- 配置 cppdbg 调试适配器
            dap.adapters.cppdbg = {
                id = "cppdbg",
                name = "cppdbg",
                type = "executable",
                command = "/home/zzfan/Environment/cpptools-linux-x64/extension/debugAdapters/bin/OpenDebugAD7",
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
                    stopOnEntry = true,
                },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end,

        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
            })
        end,
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
}
