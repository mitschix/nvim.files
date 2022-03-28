-- include friendly snipepts to luasnip
require("luasnip.loaders.from_vscode").load()

local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets(nil, {
    all = {
        s("test", {t("this is a test")}),
    },
    }
)
ls.add_snippets("python",{
    s("startmain", fmt([[#!/usr/bin/env python


def {}() -> None:
    pass


if __name__ == "__main__":
    {}()]], {i(1, "main"), rep(1)}))
    }
)
