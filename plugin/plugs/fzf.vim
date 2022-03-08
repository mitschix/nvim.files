"" fzf.vim
" set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" vim.opt.wildignore = '*.o,*.obj,.git,*.rbc,*.pyc,__pycache__'
" if 1 == vim.fn.executable("rg") then
    " vim.o.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
    " vim.o.grepformat = add('%f:%l:%c:%m', vim.o.grepformat)
    "
"     vim.env.FZF_DEFAULT_OPTS = 'rg --files --hidden --follow --glob "!.git/*"'
" vim.cmd [[
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" ]]
" else
"     vim.env.FZF_DEFAULT_OPTS = 'find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null'
"
"   end
"   vim.api.nvim_set_keymap('i', '<c-f>', "vim.fn['fzf#vim#complete#path']('rg --hidden --files')", {noremap = true, expr = true}

au FileType fzf nnoremap <silent> q :q<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader><leader>h :History:<CR>

" Fzf easy commands
inoremap <expr> <c-f> fzf#vim#complete#path('rg --hidden --files')

