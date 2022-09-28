
if !exists("g:asciidoctor_cmd")
    let g:asciidoctor_cmd = "asciidoctor-pdf"
endif
if !exists("g:renderer")
    let g:renderer = "zathura"
endif
if !exists("g:ascii_tmpfile")
    let g:ascii_tmpfile = "/tmp/ascii"
endif
let g:ascii_can_continue = 1


if !exists('CompileAscii')
    fun! ascii#CompileAscii()
        if &filetype ==# 'asciidoc'
            let s:tmp = '!' . g:asciidoctor_cmd . ' % -o ' . g:ascii_tmpfile . ' & disown'
            execute s:tmp
        else
            echoerr "Error compiling to pdf"
            g:ascii_can_continue = 0
        endif
    endfun
endif

if !exists('AsciiOpen')
    fun! ascii#AsciiOpen()
        let s:tmp = ':!' . g:renderer . ' ' . g:ascii_tmpfile . ' & disown'
        execute s:tmp
    endfun
    fun! ascii#AsciiLive()
        if g:ascii_can_continue == 1
            :silent call ascii#CompileAscii()
            :silent call ascii#AsciiOpen()
            augroup loading
                au!
                autocmd BufWrite * :silent call ascii#CompileAscii()
            augroup end
        endif
    endfun
endif
