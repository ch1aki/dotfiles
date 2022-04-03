"" show hidden file
let g:fern#default_hidden=1
"" icon
let g:fern#renderer = 'nerdfont'
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
