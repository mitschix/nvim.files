return {
    { 'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" }, build = ':TSUpdate',
    config = function ()
        require'nvim-treesitter.configs'.setup({
            ensure_installed = {
                "bash","beancount","bibtex","c","c_sharp","cmake","comment","commonlisp","cooklang","cpp","css","dockerfile","go","gomod","gowork","graphql","hjson","hocon","html","http","java","javascript","jsdoc","json","json5","jsonc","julia","kotlin","lalrpop","latex","ledger","llvm","lua","make","ninja","nix","norg","pascal","perl","php","python","ql","query","r","regex","rego","rst","ruby","rust","scheme","scss","solidity","sparql","svelte","toml","tsx","typescript","vim","yaml"
            },
            auto_install = true,
            highlight = {
                enable = true,
                -- handled by rainbow_csv
                disable = {'csv'}
            },
        })
    end
    },
    {'HiPhish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { "BufReadPre", "BufNewFile" }
    },
    {'m-demare/hlargs.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        require('hlargs').setup({
            color = '#BFAAAA',
            excluded_argnames = {declarations = { python = { 'self' } }} }
        )
    end
    },
}
