

" === FUNCTIONS ===


" Closing and Exit {{{
" custom exit function to close buffers before exiting
function! CustomExit()
    if (len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1)
        q
    else
        bd
    endif
endfunction
" }}}

" https://github.com/tjdevries/config_manager/tree/master/xdg_config {{{
" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction

" Change Settings Functions {{{
" ----------------------------------------------------------------------------
" <leader>c? : Toggle options
" ----------------------------------------------------------------------------
function! Map_change_option(...)
    let [key, opt] = a:000[0:1]
    " remap for number to disable number and relativenumber
    if key == "n"
        execute printf("nnoremap <leader>c%s :set number! relativenumber!<CR>", key)
    else
        let op = get(a:, 3, 'set '.opt.'!')
        execute printf("nnoremap <leader>c%s :%s<bar>set %s?<CR>", key, op, opt)
    endif
endfunction
" }}}

" WordCount for the Statusline {{{
" Toggle word count in the panel if you hit <leader>wc
" Update the word count if you hit <leader>wu, display in statusline
" Add %{g:word_count} to statusline to see wordcount.
" set statusline+=%{g:word_count}
let g:word_count = ''
function! WordCount(...)
    if a:0 < 1
        let s:update = 0
    else
        let s:update = 1
    endif
    if g:word_count == '' || s:update == 1
        let position = getpos(".")
        exe ":silent normal g\<c-g>"
        let stat = v:statusmsg
        let g:word_count = 0
        if stat != '--No lines in buffer--'
            let s:words =  str2nr(split(v:statusmsg)[11])
            let g:word_count = printf('.Words [%d].', s:words)
        else
            let g:word_count = 'Words [none]'
        end
        call setpos('.', position)
        return g:word_count
    else
        let g:word_count = ''
        return g:word_count
    end
endfunction
" }}}
