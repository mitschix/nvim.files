-- === MAIN VIMRC & BASIC SETTINGS===

-- basic settings {{{
-- Automatically read a file that has changed on disk
vim.opt.lazyredraw = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.updatetime = 30
vim.opt.title = true
-- " add visible column
vim.opt.colorcolumn = '101'

-- Show matching brackets.
vim.opt.showmatch = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- settings for searching= true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indention and formatting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Toggle whitespace characters
vim.opt.listchars = { tab = '»─', nbsp = '·', eol = '¬', trail = '-', extends = '»', precedes = '«' }

-- change split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- EOL formats order
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.filetype.add({
    filename = {
        ['.env.secret'] = 'secret',
    },
})

-- " do not fold when opening - fold at indention
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'

-- Minimal number of screen lines to keep above/below the cursor.
-- 15 lines when scolling horizontaly
vim.opt.scrolloff = 7
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 15
-- wrap long lines at a character in 'breakat' - display start of wrapped lines
vim.opt.linebreak = true
vim.opt.showbreak = '→'
-- set text width when to break with `gq`
vim.opt.textwidth = 100

vim.opt.undofile = true

-- <BS> <Space> h l <Left> <Right> can change lines
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')

vim.opt.shortmess:append('c')

-- if rg exists set other vim grep method
vim.opt.wildignore = '*.o,*.obj,.git,*.rbc,*.pyc,__pycache__'
if 1 == vim.fn.executable('rg') then
    vim.o.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
    vim.opt.grepformat = vim.opt.grepformat ^ { '%f:%l:%c:%m' }
end

-- https://github.com/ibhagwan/nvim-lua/blob/main/lua/init.lua
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- }}}
