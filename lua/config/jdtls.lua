local config = {
    -- 指定 jdtls 的安装路径
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx8g", -- 根据内存调整
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.expand("~/Environment/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        vim.fn.expand("~/Environment/jdt-language-server-latest/config_linux"), -- 根据系统替换为 _win 或 _mac
        "-data",
        vim.fn.expand("~/Code/Android_Project/aosp/frameworks/"), -- 指定工作区目录
    },
    root_dir = require("lspconfig.util").root_pattern(".git", "AndroidManifest.xml"), -- 识别 Android 项目根目录
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "Android",
                        path = "~/Environment/Sdk/platforms/android-34/android.jar", -- 替换为你的 Android SDK 路径
                    },
                },
            },
        },
    },
}

require("lspconfig").jdtls.setup(config)
