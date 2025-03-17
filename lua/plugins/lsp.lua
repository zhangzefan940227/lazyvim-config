return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({
            cmd = { "clangd", "--background-index" }, -- 启用后台索引
            filetypes = { "c", "cpp" },
            root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
            on_attach = function(client, bufnr)
                -- 自定义 on_attach 函数（可选）
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            end,
            settings = {
                clangd = {
                    fallbackFlags = { "-std=c++20" }, -- 设置默认的 C++ 标准
                },
            },
        })

        lspconfig.jdtls.setup({
            cmd = {
                "java", -- 确保 Java 在 PATH 中
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.level=ALL",
                "-Xmx1G", -- 设置 JVM 最大内存
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                vim.fn.expand("~/Environment/jdt-language-server-1.45.0/plugins/org.eclipse.equinox.launcher_*.jar"), -- 替换为你的 jdtls launcher 路径
                "-configuration",
                vim.fn.expand("~/Environment/jdt-language-server-1.45.0/config_linux"), -- 根据系统选择 config_linux、config_mac 或 config_win
                "-data",
                vim.fn.expand("~/.workspace"), -- 工作区目录
            },
            root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
            on_attach = function(client, bufnr)
                -- 自定义 on_attach 函数（可选）
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            end,
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-21",
                                path = "/usr/lib/jvm/java-21-openjdk-amd64", -- 替换为你的 JDK 17 路径
                            },
                        },
                    },
                },
            },
        })
    end,
}
