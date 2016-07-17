augroup ghcmodcheck
    autocmd! BufWritePost <buffer> GhcModCheckAsync
augroup END

setlocal omnifunc=necoghc#omnifunc

