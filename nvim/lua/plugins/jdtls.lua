local config = {
    cmd = {
        "java",

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-jar",
        "/home/Will/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

        "-configuration",
        "/home/Will/.local/share/nvim/mason/packages/jdtls/config_linux/",

        "-data",
        vim.fn.getcwd(),
    },

    root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

    settings = {
        java = {
            project = {
                referencedLibraries = {
                    "/home/Will/.jars/*",
                },
            },
        },
    },
}
require("jdtls").start_or_attach(config)

-- local on_attach = function(client, bufnr)
--     client.server_capabilities.semanticTokensProvider = nil
-- end
