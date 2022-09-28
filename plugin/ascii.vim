" Title:        Ascii.vim
" Description:  A plugin to livereload asciidoc files.
" Last Change:  Sep 28 2022
" Maintainer:   kavulox

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_ascii")
    finish
endif
let g:loaded_ascii = 1

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AsciiOpen call ascii#AsciiOpen()
command! -nargs=0 AsciiLive call ascii#AsciiLive()
command! -nargs=1 AsciiSaveTo call ascii#AsciiSaveTo(<f-args>)
