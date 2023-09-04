return {
    {"ivanjermakov/troublesum.nvim", config = function ()
        require("troublesum").setup({
            severity_format = {"󰅚","󰀪","󰋽","󰌶"},
        })
    end},

}
