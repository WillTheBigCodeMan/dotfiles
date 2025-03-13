local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

require("lspconfig").jdtls.setup({
    -- on_attach = on_attach,
    settings = {
        java = {
            project = {
                referencedLibraries = {
                    "/home/Will/.jars/*",
                },
            },
        },
    },
})
