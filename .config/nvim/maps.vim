" Description: Keymaps
"
imap <C-[> <esc>

nnoremap <C-]> g<C-]>

" buffer
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" tig
"" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>
"" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>
"" open tig grep
nnoremap <Leader>g :TigGrep<CR>
"" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>
"" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
"" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
"" open tig blame with current file
nnoremap <Leader>b :TigBlame<CR>

" test
nmap <silent> <leader>gt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
