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

:command! -nargs=+ Inquiry call SearchEngine(<f-args>)

