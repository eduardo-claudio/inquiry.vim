# Inquiry.vim
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
<code>:Inquiry{Msdn|Cpp|Osx|Ios} [keyword1 [keyword2] ...]</code><br>
<b>Obs.</b>: Pay attention that command is InquiryMsdn or InquiryCpp or ....<br>
<br>
The Command itself tells inquiry where to search.
The second will instruct the library's search engine to seek to keywords specified. <br>
All searches will open in the default OS browser.<br>
<br>
## Requirements<br>
You MUST have Vim compiled with python support, and according python installed.<br>
<br>
## Instalation:
### Using pathogen:
Copy and paste in your shell:

```bash
cd ~/.vim/bundle
git clone https://github.com/eduardo-claudio/inquiry.vim.git
```
<br>
## Note:<br>
It currently works on Mac OSX and Windows. To make it work on Linux, the command for opening a URL in browser must me implemented.
