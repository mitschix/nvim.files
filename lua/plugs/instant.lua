return {
    {
        'jbyuki/instant.nvim',
        lazy = true,
        cmd = { 'InstantStartServer', 'InstantJoinSession', 'InstantJoinSingle' },
        config = function() vim.g.instant_username = 'mitschix' end,
    },
}
