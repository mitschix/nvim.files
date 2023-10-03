return {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    keys = { '<Space>du', '<Space>dr' },
    dependencies = { 'mfussenegger/nvim-dap', 'theHamsta/nvim-dap-virtual-text', 'mfussenegger/nvim-dap-python' },
    config = function()
        require('dapui').setup()
        require('nvim-dap-virtual-text').setup()
        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

        local dap, dapui = require('dap'), require('dapui')
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        -- not working with closing in python
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

        -- TODO replace with lua commands
        vim.cmd([[
        let maplocalleader="\<space>"

        nnoremap <silent> <localleader>db :lua require('dap').toggle_breakpoint()<CR>
        nnoremap <silent> <localleader>dc :lua require('dap').continue()<CR>
        nnoremap <silent> <localleader>dx :lua require('dap').terminate()<CR>

        nnoremap <localleader>di :lua require('dap').step_into()<CR>
        nnoremap <localleader>dn :lua require('dap').step_over()<CR>
        nnoremap <localleader>do :lua require('dap').step_out()<CR>
        nnoremap <localleader>dp :lua require('dap').step_back()<CR>

        nnoremap <silent> <localleader>dr :lua require('dap').repl.open()<CR>
        nnoremap <silent> <localleader>du :lua require('dapui').toggle()<CR>
        ]])

        -- python setup
        require('dap-python').setup('~/testing/pyenvs/venv_debugpy/bin/python')

        vim.cmd([[
        let maplocalleader="\<space>"

        nnoremap <silent> <localleader>dtm :lua require('dap-python').test_method()<CR>
        nnoremap <silent> <localleader>dtc :lua require('dap-python').test_class()<CR>
        vnoremap <silent> <localleader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
        ]])
    end,
}
