return {
    "mfussenegger/nvim-jdtls",
    config = {
        settings = {
            java = {
                project = {
                    referencedLibraries = {
                        "lib/**/*.jar",
                    },
                },
            },
        },
    },
}
