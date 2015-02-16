# inquiry.vim
VIM editor plugin to query development libraries and / or references.

This plugin installs new command to VIM editor: <b>Inquiry</b>.<br>
The command helps to querysome development libraries or references in the web.<br>
Please, see NOTES below to use in Windows OS.<br><br>
Nowadays, the libraries / references the command is able to search are:<br>
<ul>
  <li>MSDN (Microsoft Development Network)</li>
  <li>CPP (Cplusplus.com)</li>
  <li>OSX (Apple OSX developer library)</li>
  <li>IOS (Apple IOS developer library)</li>
</ul>
<br>
The usage of Inquiry command is as follows:<br>
<code>:Inquiry {msdn|cpp|osx|ios} [keyword1 [keyword2] ...]</code><br>
<br>
The first parameter tells inquiry where to search.
The second is optional. If exists <b>Inquiry</b> will instruct the library's search engine to seek to keywords specified. Otherwise if no keyword is passed to command, <b>Inquiry</b> wil copy the word under cursor and use it as a keyword.<br>
All searches will open in the default OS browser.<br>
<br>
##Requirements<br>
You MUST have Python 2.6 or 2.7 to make Inquiry works.<br>
<br>
##Note:<br>
I've developed this in a Macintosh, so I use the OSX command <b>Open</b> to start a browser.
In Wiindows, I advise to use a simple trick to make Inquiry works:
since you must install python, create a file name  <b>open.bat</b> with the text below and put it into a folder which be in user's PATH:<br>
Code:<br>
<code>@echo off</code><br>
<code>python -c "import sys;os.system(\"start \"+sys.argv[1])" "%1"</code><br>


