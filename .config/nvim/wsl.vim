set clipboard+=unnamedplus
augroup myYank
  autocmd!
  autocmd TextYankPost * :call system('clip.exe', @")
augroup END
