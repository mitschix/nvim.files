

" === MAIN VIMRC ===


" define the config files one per line to make them easier edjustable
"custom/basic-settings.vim 	    " all basic setings and au groups
"custom/abbrev.vim      	    " containing all abbrevations
"custom/shortcuts.vim   	    " containing all shortcuts
"custom/statusline.vim  	    " custom statusline with functions - depends on some plugins
"plug-conf/plugins.vim  	    " containing list of plugins for plug
"plug-conf/colors.vim   	    " settings for colorscheme and colors
"plug-conf/fileexplorer.vim 	" settings for netrw and other file explorer
"plug-conf/git.vim          	" settings for git related plugins
"plug-conf/snippets.vim     	" settings for all snippet plugins
"plug-conf/tags.vim         	" settings for primarly gutentags
"plug-conf/others.vim'        	" simple settings for other plugins

let g:nvim_config_root = stdpath('config')
let g:config_file_list = [ 'conf-custom/basic-settings.vim',
            \ 'conf-custom/abbrev.vim',
            \ 'conf-custom/shortcuts.vim',
            \ 'conf-custom/statusline.vim',
            \ 'conf-plug/plugins.vim',
            \ 'conf-plug/colors.vim',
            \ 'conf-plug/fileexplorer.vim',
            \ 'conf-plug/git.vim',
            \ 'conf-plug/snippets.vim',
            \ 'conf-plug/tags.vim',
            \ 'conf-plug/others.vim'
            \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor
