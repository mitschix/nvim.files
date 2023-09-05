return {
    {'preservim/tagbar', lazy=true,
    keys={{'<f4>','<cmd>TagbarToggle<CR>', ''}}, init = function() vim.g.tagbar_autofocus = 1 end} ,

    {'ludovicchabant/vim-gutentags', init = function ()
            --  vim gutentags settings
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_project_root = {'requirements.txt', '.git'}
            vim.g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS'}
            -- TODO does not work with lua?
            vim.cmd("let g:gutentags_cache_dir = stdpath('data').'//tags'")
        end},
}
