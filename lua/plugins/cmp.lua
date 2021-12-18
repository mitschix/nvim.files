-- setup completion menu
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup( {
    formatting = {
        format = lspkind.cmp_format({
        menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            calc = "[Calc]",
            ultisnips = "[UltiSnip]",
            treesitter = "[TreeS]",
            spell = "[Spell]",
            nvim_lua = "[Lua]",
        })}
        ),
    },
    sources = {
        {name = "nvim_lsp"}, {name = "buffer", keyword_length = 5},
        {name = "ultisnips"}, {name = "calc"}, {name = "emoji"}, {name = "spell"},
        {name = "path"}, {name = 'treesitter'}
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

-- currently bugged
-- vim.cmd[[
-- " Setup buffer configuration (nvim-lua source only enables in Lua filetype).
-- autocmd FileType lua lua require'cmp'.setup.buffer {
    --    sources = {
        --      {name = 'nvim_lua'},
        --      {name = 'buffer'},
        --    },
        --  }
        -- ]]
