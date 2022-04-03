" Description: Keymaps
"
imap <C-[> <esc>

nnoremap <C-]> g<C-]>

" buffer
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Fern
nnoremap <silent> <C-e> :<C-u>Fern . -reveal=%<CR>

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
