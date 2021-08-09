function ClipToRegister(registerName)
  execute "let @" . a:registerName . "=@+"
endfunction

function RegisterToClip(registerName)
  execute "let @+=@" . a:registerName
endfunction

nnoremap <Leader>cr :call ClipToRegister(input("destination: "))<CR>
nnoremap <Leader>rc :call RegisterToClip(input("source: "))<CR>

