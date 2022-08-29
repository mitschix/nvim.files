

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
