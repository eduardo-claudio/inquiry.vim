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
function! EscapeUri(uri)

python << endPython
import urllib

uri = vim.eval('a:uri')
escaped = urllib.quote(uri);
vim.command("let escaped = '%s'" % escaped)
endPython

    return escaped
endfunction

function! SearchEngine(...)
    let unkeng = 0
    if a:0 > 1
        let r = EscapeUri(a:2)
    else
        let r = EscapeUri("")
    endif
    if a:1 ==? "msdn"
        let url = "https://social.msdn.microsoft.com/search/en-us/?query=" . r
    elseif a:1 ==? "cpp"
        let url = "http://www.cplusplus.com/search.do?q=" . r
    elseif a:1 ==? "osx"
        let url = "https://developer.apple.com/search/?platform=OS%20X&q=" . r
    elseif a:1 ==? "ios"
        let url = "https://developer.apple.com/search/?platform=iOS&q=" . r
    else
        echom ('Unknown search engine: '. a:1
        return
    endif

    if has('mac')
        let openUrlPattern = 'open %s'
    elseif has('win32')
        let openUrlPattern = 'start %s'
    else
        echo 'Unsupported system to start URL'
    endif

python << endPython

import sys

openUrlPattern = vim.eval('openUrlPattern')
url = vim.eval('url')

os.system(openUrlPattern % url)

endPython


endfunction

:command! -nargs=+ InquiryMsdn call SearchEngine('msdn', <f-args>)
:command! -nargs=+ InquiryCpp call SearchEngine('cpp', <f-args>)
:command! -nargs=+ InquiryOSX call SearchEngine('osx', <f-args>)
:command! -nargs=+ InquiryIOS call SearchEngine('ios', <f-args>)

