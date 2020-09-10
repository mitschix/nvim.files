

" === MAIN VIMRC ===


" define the config files one per line to make them easier edjustable
"conf-custom/basic-settings.vim     " all basic setings and au groups
"conf-custom/abbrev.vim      	    " containing all abbrevations
"conf-custom/shortcuts.vim   	    " containing all shortcuts
"conf-custom/statusline.vim  	    " custom statusline with functions - depends on some plugins
"conf-plug/plugins.vim  	        " containing list of plugins for plug
"conf-plug/colors.vim   	        " settings for colorscheme and colors
"conf-plug/coc.vim                  " coc settings
"conf-plug/fileexplorer.vim 	    " settings for netrw and other file explorer
"conf-plug/git.vim          	    " settings for git related plugins
"conf-plug/snippets.vim     	    " settings for all snippet plugins
"conf-plug/tags.vim         	    " settings for primarly gutentags
"conf-plug/others.vim'        	    " simple settings for other plugins

let g:nvim_config_root = stdpath('config')
let g:config_file_list = [ 'conf-custom/basic-settings.vim',
            \ 'conf-custom/abbrev.vim',
            \ 'conf-custom/shortcuts.vim',
            \ 'conf-custom/statusline.vim',
            \ 'conf-plug/plugins.vim',
            \ 'conf-plug/colors.vim',
            \ 'conf-plug/coc.vim',
            \ 'conf-plug/fileexplorer.vim',
            \ 'conf-plug/git.vim',
            \ 'conf-plug/snippets.vim',
            \ 'conf-plug/tags.vim',
            \ 'conf-plug/others.vim'
            \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor
