return {
    "mfussenegger/nvim-jdtls",
    config = {
        -- root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
        settings = {
            java = {
                project = {
                    referencedLibraries = {
                        "lib/**/*.jar",
                    },
                    sourcePaths = { "src" },
                },
                configuration = {
                    updateBuildConfiguration = "automatic", -- or "interactive"
                },
            },
        },
    },
}
