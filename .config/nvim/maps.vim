" Description: Keymaps
"
imap <C-[> <esc>

nnoremap <C-]> g<C-]>

" buffer
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" NERDTree
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" terminal mode
tnoremap <ESC> <C-\><C-n>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
