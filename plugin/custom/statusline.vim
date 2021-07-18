

" === STATUSLINE SETTINGS & FUNCTIONS ===


" Display number of tabs {{{
function! GetTabs()
    let l:maxtabnr = tabpagenr('$')
    let l:curtab = tabpagenr()
    return maxtabnr > 1?printf('  %d/%d ', l:curtab, l:maxtabnr):''
endfunction
" }}}

" Create Mode Display {{{
function! GetMode()
    " possible commands TODO
    "     \ 'n'  : 'N',
    "     \ 'no' : 'Normal·Operator Pending',
    "     \ 'v'  : 'V',
    "     \ 'V'  : 'VL',
    "     \ 's'  : 'Select',
    "     \ 'S'  : 'S·Line',
    "     \ '^S' : 'S·Block',
    "     \ 'i'  : 'I',
    "     \ 'R'  : 'R',
    "     \ 'Rv' : 'V·Replace',
    "     \ 'c'  : 'Command',
    "     \ 'cv' : 'Vim Ex',
    "     \ 'ce' : 'Ex',
    "     \ 'r'  : 'Prompt',
    "     \ 'rm' : 'More',
    "     \ 'r?' : 'Confirm',
    "     \ '!'  : 'Shell',
    "     \ 't'  : 'Terminal'

    let l:curmode = mode()
    if l:curmode == 'n'
        hi ModeColor ctermfg=204 ctermbg=235
        let l:out = '. N .'
    elseif l:curmode == 'i'
        hi ModeColor ctermfg=114 ctermbg=235
        let l:out = '. I .'
    elseif l:curmode == 'r'
        hi ModeColor ctermfg=39 ctermbg=235
        let l:out = '. R .'
    elseif l:curmode ==# 'v'
        hi ModeColor ctermfg=170 ctermbg=235
        let l:out = '. V .'
    elseif l:curmode ==# 'V'
        hi ModeColor ctermfg=180 ctermbg=235
        let l:out = '. VL .'
    elseif l:curmode ==# '^V'
        hi ModeColor ctermfg=173 ctermbg=235
        let l:out = '. VB .'
    elseif l:curmode == 'c'
        hi ModeColor ctermfg=blue ctermbg=235
        let l:out = '. C .'
    else
        hi ModeColor ctermfg=173 ctermbg=235
        let l:out = '. VB .'
    endif
    return l:out
endfunction
" }}}

" Statusline Settings {{{
set laststatus=2    " permanently set statusline
set statusline=
set statusline+=%#MoreMsg#%{GetTabs()}%*
set statusline+=%{GitStatus()}
set statusline+=%#DiffAdd#%{StatuslineGit()}%*
set statusline+=%#ModeColor#%{GetMode()}%*\ 
set statusline+=%F
set statusline+=\ %#Statement#%h%r%m%w%*
set statusline+=%=
set statusline+=%#DiffDelete#%{&paste?'\.PASTE\.':''}%*
set statusline+=%#DiffChange#%{&spell?'\.SPELL-\['.&spelllang.']\.':''}%*
set statusline+=%#WildMenu#%{g:word_count}%*
set statusline+=\ %y\ \|
set statusline+=\ %l/%L\ \-\ %c\ \|
set statusline+=%#MoreMsg#\ %p%%
" }}}
