

" === FUNCTIONS ===


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
