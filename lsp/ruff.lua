return {
    -- disables other on attach function (e.g. keymaps lsp-signature => handled by basedpyright)
    on_attach = function(client, _) client.server_capabilities.hoverProvider = false end,
}
