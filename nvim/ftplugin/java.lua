local function hash(str)
    local h = 5381

    for c in str:gmatch(".") do
        h = ((bit.arshift(h, 5)) + h) + string.byte(c)
    end
    return h
end

local function get_root()
    local cwd = vim.fn.getcwd()
    local hashed = hash(cwd)

    return "/home/Will/.jdtlsdata/" .. tostring(hashed)
end

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
        "/home/Will/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.1100.v20250306-0509.jar",

        "-configuration",
        "/home/Will/.local/share/nvim/mason/packages/jdtls/config_linux/",

        "-data",
        get_root(),
    },

    root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
    -- root_dir = get_root(),

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

-- require("jdtls").start_or_attach(config)

-- local on_attach = function(client, bufnr)
--     client.server_capabilities.semanticTokensProvider = nil
-- end
