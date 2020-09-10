

" === GIT PLUGIN SETTINGS ===


" function to toggle git status
" fungitive needed
"
function! ToggleGStatus()
    let l:branchname = fugitive#head()
    if strlen(l:branchname) > 0
      if buflisted(bufname('.git/index'))
          bd .git/index
      else
          :vertical 30 Gstatus
      endif
    endif
endfunction

" further gitgutter changes
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" toggle git fungitive status
map <silent> <f8> :call ToggleGStatus()<CR>

" gitgutter settings
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
