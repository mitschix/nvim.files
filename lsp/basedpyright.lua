return {
    -- https://github.com/amitds1997/dotfiles/blob/main/dot_config/nvim/lua/plugins/lsp-config/basedpyright.lua
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            disableTaggedHints = false,
            analysis = {
                typeCheckingMode = 'basic',
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticSeverityOverrides = {
                    reportIgnoreCommentWithoutRule = true,
                },
            },
        },
    },
}
