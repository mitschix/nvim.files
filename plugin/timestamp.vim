" Append this to your vimrc file
"""""""""""""""""""""""""""""""""
" auto-update the timestamp right before saving a file
" The Timestamp format is : Sat 07 Dec 2013 12:51:00 AM CST
" Within the 20 first lines, the matched lines are :
" Last [Cc]hange(d)
" Changed
" Last [Mm]odified
" Modified
" Last [Uu]pdate(d)
" source: https://gist.github.com/jelera/7838011

autocmd! BufWritePre * :call s:timestamp()
" to update timestamp when saving if its in the first 20 lines of a file
function! s:timestamp()
    let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
    let rep = '\1' . strftime("%Y%m%d") . " " . $USER
    call s:subst(1, 20, pat, rep)
endfunction
" subst taken from timestamp.vim
" {{{ subst( start, end, pat, rep): substitute on range start - end.
function! s:subst(start, end, pat, rep)
    let lineno = a:start
    while lineno <= a:end
	let curline = getline(lineno)
	if match(curline, a:pat) != -1
	    let newline = substitute( curline, a:pat, a:rep, '' )
	    if( newline != curline )
		" Only substitute if we made a change
		"silent! undojoin
		keepjumps call setline(lineno, newline)
	    endif
	endif
	let lineno = lineno + 1
    endwhile
endfunction
" }}}
