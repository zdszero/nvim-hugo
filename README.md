# nvim-hugo

A (neo)vim plugin that helps you write hugo posts quickly

## Commands

```
:HugoPost<cr>     create a new post.
:HugoSearch<cr>   search posts in content directory,
                  make sure vim-fzf plugin is installed before using this command.
:HugoServer<cr>   start server in your hugo directory
:HugoServer!<cr>  stop hugo server
:HugoBuild<cr>    build your sites
```

## Options

+ g:hugo_home_path

the path to your blog path in your computer

```
default: '~/Documents/Blog'
```

+ g:hugo_post_template

the metadata at the beginning of the passage which you use `HugoPost` to create.

```
default: [
      \ '---',
      \ 'title: HUGO_TITLE',
      \ 'date: HUGO_DATE',
      \ 'draft: true',
      \ '---',
      \ '' ]
```

+ g:hugo_post_suffix

```
default: 'md'
```

+ g:hugo_server_port

```
default: 1313
```

+ g:hugo_build_script_path

the path to your executable build script, required by command `HugoBuild`

```
let g:hugo_build_script_path = '~/Documents/Blog/build.sh'
```

## Licence

MIT License
