" nvim-hugo plugin
" Author:  zdszero
" URL:     https://github.com/zdszero/nvim-hugo
" Version: 0.0.2
" License: MIT

function! s:gsub(expr, pat, rep)
  return substitute(a:expr, '\v\C' . a:pat, a:rep, 'g')
endfunction

function! s:create_post(title)
  let format_title = s:post_title(a:title)
  let filename = format_title . '.' . g:hugo_post_suffix
  let fullpath = g:hugo_home_path .. '/content/posts/' . filename
  execute 'edit ' . fullpath
  let failed = append(0, g:hugo_post_template)
  if failed
    echoerr "Couldn't load post"
    return
  else
    let date = strftime('%F %T')
    silent! %s/HUGO_DATE/\=date/g
    silent! %s/HUGO_TITLE/\=format_title/g
  endif
endfunction

" standardize post file name
function! s:post_title(title)
  let title = s:gsub(a:title, '(^\[ ]+|[ ]+$)', '')
  let title = s:gsub(title, '[ ]{2,}', ' ')
  let title = s:gsub(title, '"', '\\"')
  return title
endfunction

function! hugo#post()
  let title = input('Input post title: ')
  call s:create_post(title)
endfunction

function! hugo#server(bang)
  if a:bang == 0
    let s:id = jobstart(['hugo', 'server', '-D', '-p', g:hugo_server_port], {'cwd': expand(g:hugo_home_path)})
    if s:id > 0
      echomsg 'server started at port ' . g:hugo_server_port
    else
      echoerr 'error in starting server'
    endif
  else
    call jobstop(s:id)
    echomsg 'server stopped'
  endif
endfunction

function! hugo#search()
  let v:errmsg = ''
  let post_dir = g:hugo_home_path . '/content'
  silent! call fzf#vim#files(post_dir)
  if v:errmsg != ''
    echomsg 'Please install fzf before using HugoSearch!'
  endif
endfunction
