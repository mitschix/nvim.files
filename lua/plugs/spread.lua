return {
    "aarondiel/spread.nvim", lazy=true,
    dependencies = {"nvim-treesitter"},
    keys = {
        {"<leader>ss", function() require("spread").out() end},
        {"<leader>sc", function() require("spread").combine() end},
    }
}
