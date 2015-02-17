function! EscapeUri(uri)
    let escapecmd = "python -c 'import urllib, sys; print urllib.quote(sys.argv[1])' '" 
    if strlen(a:uri) < 1
        execute "normal! lbye" 
        return @"
    else
        let s = join([escapecmd, a:uri, "'"], "")
    endif 
    return system(s)
endfunction

function! MakeCmd(prefix,searchpart)
    let opencmd = "!open '" 
    let n = strlen(a:searchpart)
    let r = strpart(a:searchpart,0,n-1)
    let c0 = join([a:prefix,r],"")
    return join([opencmd,escape(c0, '%'),"'"],"")
endfunction

function! SearchEngine(...)
    let unkeng = 0
    if a:0 > 1
        let r = EscapeUri(a:2)
    else
        let r = EscapeUri("")
    endif
    if a:1 ==? "msdn"
        let c = MakeCmd("https://social.msdn.microsoft.com/search/en-us/?query=",r)
    elseif a:1 ==? "cpp"
        let c = MakeCmd("http://www.cplusplus.com/search.do?q=",r)
    elseif a:1 ==? "osx"
        let c = MakeCmd("https://developer.apple.com/search/?platform=OS%20X&q=",r)
    elseif a:1 ==? "ios"
        let c = MakeCmd("https://developer.apple.com/search/?platform=iOS&q=",r)
    else
        let c = join(["echom 'Unknown search engine: ", a:1, "'"],"")
        let unkeng = 1
    endif
    if unkeng
        execute c
    else
        silent execute c
    endif
endfunction

:command! -nargs=+ Inquiry call SearchEngine(<f-args>)

