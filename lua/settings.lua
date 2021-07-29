

-- === MAIN VIMRC & BASIC SETTINGS===


-- basic settings {{{
-- Automatically read a file that has changed on disk
vim.opt.autoread = true
vim.opt.lazyredraw = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.updatetime = 30

-- let modified buffers move to the background
vim.opt.hidden = true
-- Show matching brackets.
vim.opt.showmatch = true

vim.opt.completeopt={'menuone','noinsert','noselect'}

-- settings for searching= true
vim.opt.incsearch = true
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
vim.opt.listchars={tab = '»─', nbsp = '·', eol = '¬',
                trail = '-', extends = '»', precedes = '«'}

-- change split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
-- EOL formats order
vim.opt.fileformats={'unix','dos','mac'}

-- " do not fold when opening - fold at indention
vim.opt.foldlevel= 99
vim.opt.foldmethod = 'indent'

-- Minimal number of screen lines to keep above/below the cursor.
-- 15 lines when scolling horizontaly
vim.opt.scrolloff = 7
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 15
-- wrap long lines at a character in 'breakat' - display start of wrapped lines
vim.opt.linebreak = true
vim.opt.showbreak = '→'

-- undo settings
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- <BS> <Space> h l <Left> <Right> can change lines
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')

vim.opt.shortmess:append("c")
-- }}}
