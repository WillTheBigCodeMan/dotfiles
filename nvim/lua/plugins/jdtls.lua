return {
    "mfussenegger/nvim-jdtls",
    config = {
        -- root_dir = vim.fs.root(0, { ".git", "src", "mvnw", "gradlew" }),
        settings = {
            java = {
                project = {
                    referencedLibraries = {
                        "lib/**/*.jar",
                        "Part2/server/lib/*.jar",
                    },
                    sourcePaths = { "src", "Part2/server/src" },
                },
                configuration = {
                    updateBuildConfiguration = "automatic", -- or "interactive"
                },
            },
        },
    },
}
