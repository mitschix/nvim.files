let g:startify_custom_header = [
            \ '          ▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄    ▄▄▄▄▄▄▄▄▄  ▄▄▄ ',
            \ '          ███   ███▀▀▀▀▀██▀▀█▀██  ██▀▀██▀███  ███ ',
            \ '          ██▀█  ███    ██    ███  ██  ██ ████████ ',
            \ '          ██ ██ █████████    ███  ██  ██ ██ ██ ██ ',
            \ '          ██  █▄███    ██    ██████   ██ ██ ▀▀ ██ ',
            \ '          ██   ████▄▄▄▄▄██▄▄██ ████ ▄▄██▄██    ██ ',
            \ '          ▀▀   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀ ▀▀▀▀▀▀▀    ▀▀ ',
            \]                                         


let g:startify_session_dir = '~/.config/nvim/sessions'


let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Files']                        },
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']                     },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
            \ { 'type': 'commands',  'header': ['   Commands' ]                    },
            \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.config/zsh/.zshrc' },
            \ { 'd': '~/.config/dotfiles' },
            \ ]
let g:startify_commands = [
            \ { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
            \ { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
            \ ]

let g:startify_enable_special = 0


" This plugin will let us manage our sessions very easily
" Add ! to skip the prompt
":SLoad       load a session
":SSave[!]    save a session
":SDelete[!]  delete a session
":SClose      close a session
